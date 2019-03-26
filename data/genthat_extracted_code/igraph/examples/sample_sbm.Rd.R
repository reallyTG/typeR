library(igraph)


### Name: sample_sbm
### Title: Sample stochastic block model
### Aliases: sample_sbm sbm.game sbm
### Keywords: graphs

### ** Examples


## Two groups with not only few connection between groups
pm <- cbind( c(.1, .001), c(.001, .05) )
g <- sample_sbm(1000, pref.matrix=pm, block.sizes=c(300,700))
g



