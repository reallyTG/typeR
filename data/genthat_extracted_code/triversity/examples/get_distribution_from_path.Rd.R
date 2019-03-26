library(triversity)


### Name: get_distribution_from_path
### Title: Compute the probability distribution associated to a random walk
###   following a path between the levels of a tripartite graph.
### Aliases: get_distribution_from_path

### ** Examples

data (tripartite_example)
tripartite <- get_tripartite (data=tripartite_example)

get_distribution_from_path (tripartite, path=c(2,1,2,3))
get_distribution_from_path (tripartite, path=c(2,1,2,3), initial_distribution=c(0.25,0,0.25,0.5))
get_distribution_from_path (tripartite, path=c(2,1,2,3), initial_node='i2')




