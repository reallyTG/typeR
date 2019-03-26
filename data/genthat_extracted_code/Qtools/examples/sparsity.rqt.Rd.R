library(Qtools)


### Name: sparsity.rqt
### Title: Sparsity Estimation
### Aliases: sparsity sparsity.rq sparsity.rqs sparsity.rqt

### ** Examples


## Not run: 
##D 
##D data(trees)
##D 
##D # 'rqt' object
##D 
##D fit.rqt <- tsrq(Volume ~ Height, tsf = "bc", symm = FALSE, data = trees,
##D 	lambda = seq(-10, 10, by = 0.01), tau = 0.5)
##D sparsity(fit.rqt)
##D 
##D # 'rq' object
##D 
##D fit.rq <- rq(Volume ~ Height, data = trees)
##D sparsity(fit.rq, se = "iid")
##D sparsity(fit.rq, se = "nid")
##D sparsity(fit.rq, se = "ker")
## End(Not run)




