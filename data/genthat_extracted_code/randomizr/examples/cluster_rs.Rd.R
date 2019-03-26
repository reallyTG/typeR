library(randomizr)


### Name: cluster_rs
### Title: Cluster Random Sampling
### Aliases: cluster_rs

### ** Examples

clusters <- rep(letters, times=1:26)

S <- cluster_rs(clusters = clusters)
table(S, clusters)

S <- cluster_rs(clusters = clusters, n = 13)
table(S, clusters)




