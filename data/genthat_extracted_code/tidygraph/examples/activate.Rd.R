library(tidygraph)


### Name: activate
### Title: Determine the context of subsequent manipulations
### Aliases: activate active %N>% %E>%

### ** Examples

gr <- create_complete(5) %>%
  activate(nodes) %>%
  mutate(class = sample(c('a', 'b'), 5, TRUE)) %>%
  activate(edges) %>%
  arrange(from)

# The above could be achieved using the special pipes as well
gr <- create_complete(5) %N>%
  mutate(class = sample(c('a', 'b'), 5, TRUE)) %E>%
  arrange(from)
# But as you can see it obscures what part of the graph is being targeted




