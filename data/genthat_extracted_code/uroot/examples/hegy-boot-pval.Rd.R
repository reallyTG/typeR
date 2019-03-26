library(uroot)


### Name: hegy.boot.pval
### Title: Bootstrapped P-Values for the HEGY Test Statistics
### Aliases: hegy.boot.pval
### Keywords: ts

### ** Examples

## Not run: 
##D x <- bgt.data[["LCONSEXPCO"]]
##D # this requires CUDA capable GPU
##D hegy.test(x, deterministic = c(1,1,1), lag.method = "fixed", maxlag = 1, 
##D   pvalue = "bootstrap")
##D # alternatively, full R non-parallel version
##D res <- hegy.test(x, deterministic = c(1,1,1), lag.method = "fixed", maxlag = 1)
##D hegy.boot.pval(x, res$fit, res$stat, deterministic = c(1,1,1), 
##D   lag.method = "fixed", maxlag = 1, nb = 1000)
## End(Not run)



