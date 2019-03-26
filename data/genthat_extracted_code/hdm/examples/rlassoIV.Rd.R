library(hdm)


### Name: rlassoIV
### Title: Post-Selection and Post-Regularization Inference in Linear
###   Models with Many Controls and Instruments
### Aliases: rlassoIV rlassoIV.default rlassoIV.formula rlassoIVmult

### ** Examples

## Not run: 
##D data(EminentDomain)
##D z <- EminentDomain$logGDP$z # instruments
##D x <- EminentDomain$logGDP$x # exogenous variables
##D y <- EminentDomain$logGDP$y # outcome varialbe
##D d <- EminentDomain$logGDP$d # treatment / endogenous variable
##D lasso.IV.Z = rlassoIV(x=x, d=d, y=y, z=z, select.X=FALSE, select.Z=TRUE) 
##D summary(lasso.IV.Z)
##D confint(lasso.IV.Z)
## End(Not run)



