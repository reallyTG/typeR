library(EasyMx)


### Name: emxCovariances
### Title: Create a set of covariances
### Aliases: emxCovariances

### ** Examples

   
# Create a covariance matrix
require(EasyMx)
manVars <- paste0('x', 1:6)
latVars <- paste0('F', 1:2)
emxCovariances(manVars, type='full')
emxCovariances(latVars, type='corr', path=TRUE)





