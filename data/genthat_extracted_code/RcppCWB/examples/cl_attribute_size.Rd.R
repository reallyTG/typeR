library(RcppCWB)


### Name: cl_attribute_size
### Title: Get Attribute Size (of Positional/Structural Attribute).
### Aliases: cl_attribute_size

### ** Examples

registry <- if (!check_pkg_registry_files()) use_tmp_registry() else get_pkg_registry()

Sys.setenv(CORPUS_REGISTRY = registry)
token_no <- cl_attribute_size("REUTERS", attribute = "word", attribute_type = "p")
corpus_positions <- seq.int(from = 0, to = token_no - 1)
cl_cpos2id("REUTERS", "word", cpos = corpus_positions)

places_no <- cl_attribute_size("REUTERS", attribute = "places", attribute_type = "s")
strucs <- seq.int(from = 0, to = places_no - 1)
cl_struc2str("REUTERS", "places", struc = strucs)



