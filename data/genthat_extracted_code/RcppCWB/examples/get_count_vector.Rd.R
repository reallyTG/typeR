library(RcppCWB)


### Name: get_count_vector
### Title: Get Vector with Counts for Positional Attribute.
### Aliases: get_count_vector

### ** Examples

registry <- if (!check_pkg_registry_files()) use_tmp_registry() else get_pkg_registry()
y <- get_count_vector(
  corpus = "REUTERS", p_attribute = "word",
  registry = registry
  )
df <- data.frame(token_id = 0:(length(y) - 1), count = y)
df[["token"]] <- cl_id2str(
  "REUTERS", p_attribute = "word",
  id = df[["token_id"]], registry = registry
  )
df <- df[,c("token", "token_id", "count")] # reorder columns
df <- df[order(df[["count"]], decreasing = TRUE),]
head(df)



