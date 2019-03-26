library(igraph)


### Name: sample_correlated_gnp_pair
### Title: Sample a pair of correlated G(n,p) random graphs
### Aliases: sample_correlated_gnp_pair
### Keywords: graphs graphs,random

### ** Examples

gg <- sample_correlated_gnp_pair(n = 10, corr = .8, p = .5,
           directed = FALSE)
gg
cor(as.vector(gg[[1]][]), as.vector(gg[[2]][]))



