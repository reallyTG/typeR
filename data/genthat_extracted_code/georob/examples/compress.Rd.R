library(georob)


### Name: compress
### Title: Compact Storage of Symmetric and Triangular Matrices
### Aliases: compress expand
### Keywords: models spatial robust

### ** Examples

## Not run: 
##D 
##D data(meuse)
##D 
##D r.logzn.rob <- georob(log(zinc) ~ sqrt(dist) + ffreq, data = meuse, locations = ~ x + y,
##D     variogram.model = "RMexp",
##D     param = c(variance = 0.15, nugget = 0.05, scale = 200),
##D     tuning.psi = 1)
##D   
##D cov2cor(expand(r.logzn.rob[["cov"]][["cov.betahat"]]))
## End(Not run)



