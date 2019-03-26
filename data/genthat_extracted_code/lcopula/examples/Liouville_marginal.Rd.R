library(lcopula)


### Name: Liouville_marginal
### Title: Liouville vectors marginal functions
### Aliases: Liouville_marginal dliouvm isliouvm pliouvm sliouvm

### ** Examples

## Not run: 
##D #Marginal density
##D samp <- rliouv(n = 100, family = "clayton", alphavec <- c(2,3), theta = 2)
##D dliouvm(x=samp[,1], family="clayton", alpha=2, theta=2)
##D sum(log(dliouvm(x=samp[,1], family="clayton", alpha=2, theta=2)))
##D #Marginal distribution and (inverse) survival function
##D x <- rliouv(n = 100, family = "gumbel", alphavec <- c(2,3), theta = 2)
##D pliouvm(x[,1], family="gumbel", alpha=alphavec[1], theta=2)
##D su <- sliouvm(1-x[,1], family="gumbel", alpha=alphavec[1], theta=2)
##D isliouvm(u=su, family="clayton", alpha=2, theta=2)
##D #pliouv is the same as sliouv(isliouvm)
## End(Not run)



