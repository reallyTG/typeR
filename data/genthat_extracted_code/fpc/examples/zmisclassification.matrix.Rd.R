library(fpc)


### Name: zmisclassification.matrix
### Title: Matrix of misclassification probabilities between mixture
###   components
### Aliases: zmisclassification.matrix
### Keywords: cluster multivariate

### ** Examples

  set.seed(12345)
  m <- rpois(20,lambda=5)
  dim(m) <- c(5,4)
  m <- m/apply(m,1,sum)
  round(zmisclassification.matrix(m,symmetric=FALSE),digits=2) 



