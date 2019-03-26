library(denoiseR)


### Name: imputeada
### Title: Adaptive Shrinkage with missing values - Imputation
### Aliases: imputeada

### ** Examples

don.NA <- LRsim(200, 500, 100, 4)$X
don.NA[sample(1:(200*500),20, replace = FALSE)] <- NA
## Not run: 
##D adaNA <- imputeada(don.NA, lambda = 0.022, gamma = 2.3)
##D esti <- adaNA$mu.hat
##D comp <- adaNA$completeObs
## End(Not run)



