library(npcp)


### Name: cpRho
### Title: Test for Change-Point Detection Based on Spearman's Rho
### Aliases: cpRho
### Keywords: htest multivariate nonparametric ts

### ** Examples

## Not run: 
##D require(copula)
##D n <- 100
##D k <- 50 ## the true change-point
##D u <- rCopula(k,gumbelCopula(1.5))
##D v <- rCopula(n-k,gumbelCopula(3))
##D x <- rbind(u,v)
##D cp <- cpRho(x, b = 1)
##D cp
##D ## Estimated change-point
##D which(cp$rho == max(cp$rho))
## End(Not run)



