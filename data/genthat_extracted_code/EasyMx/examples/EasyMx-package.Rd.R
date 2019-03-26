library(EasyMx)


### Name: EasyMx-package
### Title: EasyMx: Easy modeling in OpenMx
### Aliases: EasyMx-package EasyMx

### ** Examples


# Make and run a one factor model
require(EasyMx)

data(demoOneFactor)
fmod <- list(G=names(demoOneFactor))
fit1 <- emxFactorModel(fmod, demoOneFactor, run=TRUE)
summary(fit1)



