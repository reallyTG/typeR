library(pse)


### Name: LHS
### Title: Latin Hypercube Sampling for Uncertainty and Sensitivity
###   Analyses
### Aliases: LHS print.LHS tell tell.LHS

### ** Examples

completeLHS <- LHS(model=function(x) x[,1]+x[,2]*x[,3], factors=3, N=20)
incompleteLHS <- LHS(factors=5, N=30)
incompleteLHS <- tell(incompleteLHS, seq(1,30))

## Not run: 
##D new.cluster <- parallel::makePSOCKcluster(c("localhost", "localhost"))
##D clusterLHS <- LHS(model=function(x) x[,1]/x[,2], factors=2, N=100, cl = new.cluster)
##D stopCluster(new.cluster)
## End(Not run)



