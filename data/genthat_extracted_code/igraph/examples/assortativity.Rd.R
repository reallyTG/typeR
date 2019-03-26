library(igraph)


### Name: assortativity
### Title: Assortativity coefficient
### Aliases: assortativity assortativity.degree assortativity_degree
###   assortativity.nominal assortativity_nominal assortativity_nominal
###   assortativity_degree
### Keywords: graphs

### ** Examples


# random network, close to zero
assortativity_degree(sample_gnp(10000, 3/10000))

# BA model, tends to be dissortative
assortativity_degree(sample_pa(10000, m=4))



