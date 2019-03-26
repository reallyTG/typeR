library(tidygraph)


### Name: graph_join
### Title: Join graphs on common nodes
### Aliases: graph_join

### ** Examples

gr1 <- create_notable('bull') %>%
  activate(nodes) %>%
  mutate(name = letters[1:5])
gr2 <- create_ring(10) %>%
  activate(nodes) %>%
  mutate(name = letters[4:13])

gr1 %>% graph_join(gr2)



