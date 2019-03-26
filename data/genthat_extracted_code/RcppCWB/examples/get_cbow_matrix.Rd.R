library(RcppCWB)


### Name: get_cbow_matrix
### Title: Get CBOW Matrix.
### Aliases: get_cbow_matrix

### ** Examples

registry <- if (!check_pkg_registry_files()) use_tmp_registry() else get_pkg_registry()

m <- get_region_matrix(
  corpus = "REUTERS", s_attribute = "places",
  strucs = 0L:5L, registry = registry
  )
windowsize <- 3L
m2 <- get_cbow_matrix(
  corpus = "REUTERS", p_attribute = "word",
  registry = registry, matrix = m, window = windowsize
  )
colnames(m2) <- c(-windowsize:-1, "node", 1:windowsize)



