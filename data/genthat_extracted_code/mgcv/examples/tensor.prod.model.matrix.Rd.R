library(mgcv)


### Name: tensor.prod.model.matrix
### Title: Utility functions for constructing tensor product smooths
### Aliases: tensor.prod.model.matrix tensor.prod.penalties
### Keywords: models smooth regression

### ** Examples

require(mgcv)
X <- list(matrix(1:4,2,2),matrix(5:10,2,3))
tensor.prod.model.matrix(X)

S<-list(matrix(c(2,1,1,2),2,2),matrix(c(2,1,0,1,2,1,0,1,2),3,3))
tensor.prod.penalties(S)




