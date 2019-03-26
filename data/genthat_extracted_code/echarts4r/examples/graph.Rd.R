library(echarts4r)


### Name: e_graph
### Title: Graph
### Aliases: e_graph e_graph_gl e_graph_nodes e_graph_edges

### ** Examples

value <- rnorm(10, 10, 2)

nodes <- data.frame(
  name = sample(LETTERS, 10),
  value = value,
  size = value,
  grp = rep(c("grp1", "grp2"), 5),
  stringsAsFactors = FALSE
)

edges <- data.frame(
  source = sample(nodes$name, 20, replace = TRUE),
  target = sample(nodes$name, 20, replace = TRUE),
  stringsAsFactors = FALSE
)

e_charts() %>% 
  e_graph() %>% 
  e_graph_nodes(nodes, name, value, size, grp) %>% 
  e_graph_edges(edges, source, target)

#Use graphGL for larger networks
nodes <- data.frame(
  name = paste0(LETTERS, 1:1000),
  value = rnorm(1000, 10, 2),
  size = rnorm(1000, 10, 2),
  grp = rep(c("grp1", "grp2"), 500),
  stringsAsFactors = FALSE
)

edges <- data.frame(
  source = sample(nodes$name, 2000, replace = TRUE),
  target = sample(nodes$name, 2000, replace = TRUE),
  stringsAsFactors = FALSE
)

e_charts() %>% 
  e_graph_gl() %>% 
  e_graph_nodes(nodes, name, value, size, grp) %>% 
  e_graph_edges(edges, source, target)




