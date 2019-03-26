library(lhs)


### Name: randomLHS
### Title: Random Latin Hypercube
### Aliases: randomLHS 'latin hypercube'
### Keywords: design

### ** Examples

  # draw a Latin hypercube
  randomLHS(4, 3)
  
  # transform a Latin hypercube
  X <- randomLHS(5, 2)
  Y <- matrix(0, nrow=5, ncol=2)
  Y[,1] <- qnorm(X[,1], mean=3, sd=0.1)
  Y[,2] <- qbeta(X[,2], shape1=2, shape2=3)
  
  # check the preserveDraw option
  set.seed(1976)
  X <- randomLHS(6,3,preserveDraw=TRUE)
  set.seed(1976)
  Y <- randomLHS(6,5,preserveDraw=TRUE)
  all(abs(X - Y[,1:3]) < 1E-12) # TRUE



