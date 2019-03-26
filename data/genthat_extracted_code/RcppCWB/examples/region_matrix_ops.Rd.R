library(RcppCWB)


### Name: region_matrix_ops
### Title: Get IDs and Counts for Region Matrices.
### Aliases: region_matrix_ops region_matrix_to_ids
###   region_matrix_to_count_matrix

### ** Examples

registry <- if (!check_pkg_registry_files()) use_tmp_registry() else get_pkg_registry()

# Scenario 1: Get full text for a subcorpus defined by regions
m <- get_region_matrix(
  corpus = "REUTERS", s_attribute = "places",
  strucs = 4L:5L, registry = registry
  )
ids <- region_matrix_to_ids(
  corpus = "REUTERS", p_attribute = "word",
  registry = registry, matrix = m
  )
tokenstream <- cl_id2str(
  corpus = "REUTERS", p_attribute = "word",
  registry = registry, id = ids
  )
txt <- paste(tokenstream, collapse = " ")
txt

# Scenario 2: Get data.frame with counts for region matrix
y <- region_matrix_to_count_matrix(
  corpus = "REUTERS", p_attribute = "word",
  registry = registry, matrix = m
  )
df <- as.data.frame(y)
colnames(df) <- c("token_id", "count")
df[["token"]] <- cl_id2str(
  "REUTERS", p_attribute = "word",
  registry = registry, id = df[["token_id"]]
  )
df[order(df[["count"]], decreasing = TRUE),]
head(df)



