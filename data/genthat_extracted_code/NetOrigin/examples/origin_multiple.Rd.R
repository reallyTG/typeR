library(NetOrigin)


### Name: origin_multiple
### Title: Multiple origin estimation using community partitioning
### Aliases: origin_multiple

### ** Examples

data(ptnAth)
# backtracking
origin_multiple(events=delayAth[10,-c(1:2)], type='backtracking', graph=ptnAth, no=2)
# edm
athnet <- igraph::as_adjacency_matrix(ptnAth, sparse=FALSE)
p <- athnet/rowSums(athnet)
eff <- eff_dist(p)
origin_multiple(events=delayAth[10,-c(1:2)], type='edm', graph=ptnAth, no=2, distance=eff)




