library(funLBM)


### Name: simulateData
### Title: Simulate data for funLBM
### Aliases: simulateData

### ** Examples

# Simulate data and co-clustering
set.seed(12345)
X = simulateData(n = 30, p = 30, t = 15)
out = funLBM(X$data,K=4,L=3)

# Visualization of results
plot(out,type='blocks')
plot(out,type='proportions')
plot(out,type='means')

# Evaluating clustering results
ari(out$col_clust,X$col_clust)
ari(out$row_clust,X$row_clust)



