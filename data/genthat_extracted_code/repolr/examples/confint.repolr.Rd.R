library(repolr)


### Name: confint.repolr
### Title: Confidence Intervals for repolr Model Parameters
### Aliases: confint.repolr

### ** Examples

data(HHSpain)
mod.0 <- repolr(HHSpain~Sex*Time, data=HHSpain, categories=4, subjects="Patient",
            times=c(1,2,5), corr.mod="uniform", alpha=0.5)
confint(mod.0, robust.var = FALSE)



