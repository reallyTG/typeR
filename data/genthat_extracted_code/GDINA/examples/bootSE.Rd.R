library(GDINA)


### Name: bootSE
### Title: Calculating standard errors and variance-covariance matrix using
###   bootstrap methods
### Aliases: bootSE

### ** Examples

## Not run: 
##D # For illustration, only 5 resamples are run
##D # results are definitely not reliable
##D 
##D dat <- sim30GDINA$simdat
##D Q <- sim30GDINA$simQ
##D fit <- GDINA(dat = dat, Q = Q, model = "GDINA",att.dist = "higher.order")
##D boot.fit <- bootSE(fit,bootsample = 5,randomseed=123)
##D boot.fit$delta.se
##D boot.fit$lambda.se
## End(Not run)



