# -------------------------------------------------------
# TECHNOGIX
# -------------------------------------------------------
# Copyright (c) [2021] Technogix.io
# All rights reserved
# -------------------------------------------------------
# Module to deploy an aws configuration recorder with all
# the secure components required
# -------------------------------------------------------
# Nadège LEMPERIERE, @12 november 2021
# Latest revision: 12 november 2021
# -------------------------------------------------------

terraform {
	experiments = [ module_variable_optional_attrs ]
}

# -------------------------------------------------------
# Contact e-mail for this deployment
# -------------------------------------------------------
variable "email" {
	type 	= string
}

# -------------------------------------------------------
# Environment for this deployment (prod, preprod, ...)
# -------------------------------------------------------
variable "environment" {
	type 	= string
}

# -------------------------------------------------------
# Topic context for this deployment
# -------------------------------------------------------
variable "project" {
	type    = string
}
variable "module" {
	type 	= string
}

# -------------------------------------------------------
# Solution version
# -------------------------------------------------------
variable "git_version" {
	type    = string
	default = "unmanaged"
}

#  -------------------------------------------------------
# Bucket description
# --------------------------------------------------------
variable "bucket" {
	type = object({
		name 	= string
		prefix	= string
	})
}

#  -------------------------------------------------------
# Cloudwatch role to use for logging
# --------------------------------------------------------
variable "cloudwatch" {
	type = object({
		role	= string
	})
}

# -------------------------------------------------------
# Config rules
# -------------------------------------------------------
variable "rules" {
	type = list(object({
		name			= string,
		source 			= object({
			owner = string,
			source_identifier = string
		}),
		input			= optional(string),
		scope			= object({
			compliance_resource_id 		= optional(string)
			compliance_resource_types   = optional(list(string))
			tag_key   					= optional(string)
			tag_value   				= optional(string)
		})
	}))
}