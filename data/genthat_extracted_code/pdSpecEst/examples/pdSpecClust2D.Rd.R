library(pdSpecEst)


### Name: pdSpecClust2D
### Title: Intrinsic wavelet HPD time-varying spectral clustering
### Aliases: pdSpecClust2D

### ** Examples

## Not run: 
##D ## Generate noisy HPD surfaces for 6 subjects in 2 groups
##D n <- c(2^5, 2^5)
##D P <- array(c(rExamples2D(n, example = "tvar", replicates = 3)$P,
##D              rExamples2D(n, example = "tvar", replicates = 3)$P), dim = c(2, 2, n, 6))
##D cl <- pdSpecClust2D(P, K = 2, metric = "logEuclidean")
## End(Not run)




