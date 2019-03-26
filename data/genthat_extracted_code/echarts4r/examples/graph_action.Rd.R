library(echarts4r)


### Name: graph_action
### Title: Nodes Adjacency
### Aliases: graph_action e_focus_adjacency e_unfocus_adjacency

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
  e_graph_edges(edges, source, target) %>% 
  e_focus_adjacency(
    seriesIndex = 0,
    dataIndex = 4
  )




