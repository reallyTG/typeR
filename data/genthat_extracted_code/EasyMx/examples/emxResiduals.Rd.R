library(EasyMx)


### Name: emxResiduals
### Title: Create a residual variances matrix
### Aliases: emxResiduals

### ** Examples

   
# Create a residual variance matrix
require(EasyMx)
manVars <- paste0('x', 1:6)
emxResiduals(manVars, lbound=1e-6)
emxResiduals(manVars, type='identical')
emxResiduals(manVars, path=TRUE)




