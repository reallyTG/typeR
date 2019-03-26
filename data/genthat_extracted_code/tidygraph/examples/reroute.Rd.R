library(tidygraph)


### Name: reroute
### Title: Change terminal nodes of edges
### Aliases: reroute

### ** Examples

# Switch direction of edges
create_notable('meredith') %>%
  activate(edges) %>%
  reroute(from = to, to = from)

# Using subset
create_notable('meredith') %>%
  activate(edges) %>%
  reroute(from = 1, subset = to > 10)



