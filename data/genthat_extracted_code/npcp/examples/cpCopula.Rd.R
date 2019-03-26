library(npcp)


### Name: cpCopula
### Title: Test for Change-Point Detection in Multivariate Observations
###   Sensitive to Changes in the Copula
### Aliases: cpCopula
### Keywords: htest multivariate nonparametric ts

### ** Examples

## Not run: 
##D require(copula)
##D n <- 100
##D k <- 50 ## the true change-point
##D u <- rCopula(k, gumbelCopula(1.5))
##D v <- rCopula(n - k, gumbelCopula(3))
##D x <- rbind(u,v)
##D cp <- cpCopula(x, b = 1)
##D cp
##D ## Estimated change-point
##D which(cp$cvm == max(cp$cvm))
## End(Not run)



