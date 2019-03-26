library(RcppCWB)


### Name: cqp_query
### Title: Execute CQP Query and Retrieve Results.
### Aliases: cqp_query cqp_dump_subcorpus cqp_subcorpus_size
###   cqp_list_subcorpora

### ** Examples

registry <- if (!check_pkg_registry_files()) use_tmp_registry() else get_pkg_registry()

if (!cqp_is_initialized()){
  cqp_initialize(registry = registry)
} else {
  if (cqp_get_registry() != registry) cqp_reset_registry(registry)
}
cqp_query(corpus = "REUTERS", query = '"oil";')
cqp_subcorpus_size("REUTERS")
cqp_dump_subcorpus("REUTERS")

cqp_query(corpus = "REUTERS", query = '"crude" "oil";')
cqp_subcorpus_size("REUTERS", subcorpus = "QUERY")
cqp_dump_subcorpus("REUTERS")



