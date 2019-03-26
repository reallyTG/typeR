library(DiagrammeR)


### Name: get_jaccard_similarity
### Title: Get Jaccard similarity coefficient scores
### Aliases: get_jaccard_similarity

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph(
    directed = FALSE) %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23)

# Get the Jaccard similarity
# values for nodes `5`, `6`,
# and `7`
graph %>%
  get_jaccard_similarity(
    nodes = 5:7)



