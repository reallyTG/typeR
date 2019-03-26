library(repolr)


### Name: work.corr
### Title: Working Correlation Matrix for Fitted repolr Model
### Aliases: work.corr

### ** Examples

data(HHSpain)
mod.0 <- repolr(HHSpain~Sex*Time, data=HHSpain, categories=4, subjects="Patient",
            times=c(1,2,5), corr.mod="uniform", alpha=0.5)
work.corr(mod.0)



