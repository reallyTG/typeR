library(repolr)


### Name: vcov.repolr
### Title: Calculates the Variance-Covariance Matrix for Fitted repolr
###   Model
### Aliases: vcov.repolr

### ** Examples

data(HHSpain)
mod.0 <- repolr(HHSpain~Sex*Time, data=HHSpain, categories=4, subjects="Patient",
            times=c(1,2,5), corr.mod="uniform", alpha=0.5)
vcov(mod.0, robust.var = FALSE)



