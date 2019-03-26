library(igraph)


### Name: sample_correlated_gnp
### Title: Generate a new random graph from a given graph by randomly
###   adding/removing edges
### Aliases: sample_correlated_gnp

### ** Examples

g <- sample_gnp(1000, .1)
g2 <- sample_correlated_gnp(g, corr = 0.5)
cor(as.vector(g[]), as.vector(g2[]))
g
g2



