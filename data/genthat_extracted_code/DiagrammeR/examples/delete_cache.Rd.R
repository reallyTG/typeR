library(DiagrammeR)


### Name: delete_cache
### Title: Delete vectors cached in a graph object
### Aliases: delete_cache

### ** Examples

# Create an empty graph
graph <-
  create_graph()

# Cache 3 different vectors inside
# the graph object
graph <-
  graph %>%
  set_cache(
    name = "a",
    to_cache = 1:4) %>%
  set_cache(
    name = "b",
    to_cache = 5:9) %>%
  set_cache(
    name = "c",
    to_cache = 10:14)

# Delete cache `b`
graph <-
  graph %>%
  delete_cache(name = "b")

# Delete remaining cached vectors
graph <-
  graph %>%
  delete_cache()



