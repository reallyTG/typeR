library(EasyMx)


### Name: emxFactorModel
### Title: Create a factor model
### Aliases: emxFactorModel emxModelFactor

### ** Examples

   
# Example
require(EasyMx)
data(myFADataRaw)
xmap <- list(F1=paste0('x', 1:6), F2=paste0('y', 1:3), F3=paste0('z', 1:3))
mod <- emxFactorModel(xmap, data=myFADataRaw, run=TRUE)





