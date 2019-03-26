library(corpustools)


### Name: ego_semnet
### Title: Create an ego network
### Aliases: ego_semnet

### ** Examples

tc = create_tcorpus(c('a b c', 'd e f', 'a d'))
g = tc$semnet('token')

igraph::get.data.frame(g)
## Not run: plot_semnet(g)

## only keep nodes directly connected to given node
g_ego = ego_semnet(g, 'e')
igraph::get.data.frame(g_ego)
## Not run: plot_semnet(g_ego)

## only keep edges directly connected to given node
g_ego = ego_semnet(g, 'e', only_filter_vertices = FALSE)
igraph::get.data.frame(g_ego)
## Not run: plot_semnet(g_ego)

## only keep nodes connected to given node with a specified degree (i.e. distance)
g_ego = ego_semnet(g, 'e', depth = 2)
igraph::get.data.frame(g_ego)
## Not run: plot_semnet(g_ego)



