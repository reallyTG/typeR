library(funLBM)


### Name: funLBM
### Title: The functional latent block model
### Aliases: funLBM
### Keywords: Clustering Functional data

### ** Examples

## Co-clustering on simulated data with K=4 and L=3
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

## No test: 
## Co-clustering on simulated data with parallel model selection
## To enable parallel computation (on Linux and Mac systems), 
## set mc.cores to the number of available CPUs
## and increase nbinit to allow the best possible fit
set.seed(12345)
X = simulateData(n = 30, p = 30, t = 15)
out = funLBM(X$data,K=2:4,L=2:4,init = "funFEM",mc.cores = 1,nbinit = 1)

# Evaluating clustering results
ari(out$col_clust,X$col_clust)
ari(out$row_clust,X$row_clust)

## Co-clustering of Velib data
data(Velib)
out = funLBM(Velib$data,K=4,L=2)

# Visualization of results
plot(out,type='blocks')
plot(out,type='proportions')
plot(out,type='means')
## End(No test)



