library(spatialprobit)


### Name: c.sarprobit
### Title: Combine different SAR probit estimates into one
### Aliases: c.sarprobit

### ** Examples

## Not run: 
##D ## parallel estimation using mclapply() under Unix (will not work on Windows)
##D library(parallel)
##D mc <- 2 # number of cores; set as appropriate to your hardware
##D run1 <- function(...) sar_probit_mcmc(y, X, W, ndraw=500, burn.in=200, thinning=1)
##D system.time( {
##D ## To make this reproducible:
##D set.seed(123, "L'Ecuyer")
##D sarprobit.res <- do.call(c, mclapply(seq_len(mc), run1))
##D })
##D summary(sarprobit.res)
##D 
##D 
##D ## parallel estimation using parLapply() under Windows
##D library(parallel)
##D ndraw <- 1000  # the number of MCMC draws
##D mc <- 4        # the number of cores; set as appropriate to your hardware
##D 
##D run1 <- function(...) {
##D   args <- list(...)
##D   library(spatialprobit)
##D   sar_probit_mcmc(y=args$y, X=args$X2, W=args$W, ndraw=args$ndraw, burn.in=100, thinning=1)
##D }
##D 
##D parallelEstimation <- function(mc, ndraw, y, X, W) {
##D   cl <- makeCluster(mc)
##D   ## To make this reproducible:
##D   clusterSetRNGStream(cl, 123)
##D   library(spatialprobit) # needed for c() method on master
##D   sarprobit.res <- do.call(c, parLapply(cl, seq_len(mc), run1, y=y, X2=X, W=W, ndraw=ndraw/mc))
##D   stopCluster(cl)
##D   return(sarprobit.res)
##D }
##D 
##D # parallel estimation using 1, 2, 4 and 8 cores
##D system.time(p1 <- parallelEstimation(mc=1, ndraw=5000, y=y, X=X, W=W))
##D system.time(p2 <- parallelEstimation(mc=2, ndraw=5000, y=y, X=X, W=W))
##D system.time(p4 <- parallelEstimation(mc=4, ndraw=5000, y=y, X=X, W=W))
##D system.time(p8 <- parallelEstimation(mc=8, ndraw=5000, y=y, X=X, W=W))
## End(Not run)



