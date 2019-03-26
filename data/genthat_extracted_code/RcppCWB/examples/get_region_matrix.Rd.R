library(RcppCWB)


### Name: get_region_matrix
### Title: Get Matrix with Regions for Strucs.
### Aliases: get_region_matrix

### ** Examples

registry <- if (!check_pkg_registry_files()) use_tmp_registry() else get_pkg_registry()
y <- get_region_matrix(
  corpus = "REUTERS", s_attribute = "id",
  strucs = 0L:5L, registry = registry
  )



