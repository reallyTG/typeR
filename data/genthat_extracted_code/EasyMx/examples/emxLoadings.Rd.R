library(EasyMx)


### Name: emxLoadings
### Title: Create a factor loadings matrix
### Aliases: emxLoadings

### ** Examples

   
# Create a loadings matrix
require(EasyMx)
xmap <- list(F1=paste0('x', 1:6), F2=paste0('y', 1:3), F3=paste0('z', 1:3))
emxLoadings(xmap)
emxLoadings(xmap, path=TRUE)




