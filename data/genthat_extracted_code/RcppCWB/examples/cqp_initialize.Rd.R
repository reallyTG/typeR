library(RcppCWB)


### Name: cqp_initialize
### Title: Initialize Corpus Query Processor (CQP).
### Aliases: cqp_initialize cqp_is_initialized cqp_get_registry
###   cqp_reset_registry

### ** Examples

cqp_is_initialized() # check initialization status
if (!cqp_is_initialized()) cqp_initialize()
cqp_is_initialized() # check initialization status (TRUE now?)
cqp_get_registry() # get registry dir used by CQP

registry <- if (!check_pkg_registry_files()) use_tmp_registry() else get_pkg_registry()
if (cqp_get_registry() != registry) cqp_reset_registry(registry = registry)
cqp_list_corpora() # get list of corpora



