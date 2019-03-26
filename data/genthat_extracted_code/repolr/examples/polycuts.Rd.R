library(repolr)


### Name: polycuts
### Title: Estimates Cut-point Parameters for Fitted repolr Model
### Aliases: polycuts
### Keywords: models

### ** Examples


data(HHSpain)
mod.0 <- repolr(HHSpain~Sex*Time, data=HHSpain, categories=4, subjects="Patient",
            times=c(1,2,5), corr.mod="uniform", alpha=0.5)
summary(mod.0)
mod.1 <- update(mod.0, poly=1)
summary(mod.1)
polycuts(mod.1)
mod.2 <- update(mod.0, poly=2)
summary(mod.2)
polycuts(mod.2)




