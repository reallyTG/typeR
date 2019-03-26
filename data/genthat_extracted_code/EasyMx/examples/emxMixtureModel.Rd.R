library(EasyMx)


### Name: emxMixtureModel
### Title: Create a mixture model
### Aliases: emxMixtureModel emxModelMixture

### ** Examples

   
# Example
require(EasyMx)
data(myFADataRaw)
xmap1 <- list(F1=paste0('x', 1:6), F2=paste0('y', 1:3), F3=paste0('z', 1:3))
mod1 <- emxFactorModel(xmap1, data=myFADataRaw, name='m1')

xmap2 <- list(F1=c(paste0('x', 1:6), paste0('y', 1:3), paste0('z', 1:3)))
mod2 <- emxFactorModel(xmap2, data=myFADataRaw, name='m2')

mod <- emxMixtureModel(list(mod1, mod2), data=myFADataRaw)
# To estimate parameters either
#  1. mod <- mxRun(mod)   or
#  2. include run=TRUE in the arguments above
summary(mod)
coef(mod)





