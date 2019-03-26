library(echarts4r)


### Name: e_modularity
### Title: Modularity
### Aliases: e_modularity

### ** Examples

nodes <- data.frame(
  name = paste0(LETTERS, 1:100),
  value = rnorm(100, 10, 2),
  stringsAsFactors = FALSE
)

edges <- data.frame(
  source = sample(nodes$name, 200, replace = TRUE),
  target = sample(nodes$name, 200, replace = TRUE),
  stringsAsFactors = FALSE
)

e_charts() %>% 
  e_graph() %>% 
  e_graph_nodes(nodes, name, value) %>% 
  e_graph_edges(edges, source, target) %>% 
  e_modularity(
    list(
      resolution = 5,
      sort = TRUE
    )
  )
  



