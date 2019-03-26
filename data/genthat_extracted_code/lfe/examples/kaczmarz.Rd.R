library(lfe)


### Name: kaczmarz
### Title: Solve a linear system defined by factors
### Aliases: kaczmarz

### ** Examples


## create factors
  f1 <- factor(sample(24000,100000,replace=TRUE))
  f2 <- factor(sample(20000,length(f1),replace=TRUE))
  f3 <- factor(sample(10000,length(f1),replace=TRUE))
  f4 <- factor(sample(8000,length(f1),replace=TRUE))
## the matrix of dummies
  D <- makeDmatrix(list(f1,f2,f3,f4))
  dim(D)
## an x
  truex <- runif(ncol(D))
## and the right hand side
  R <- as.vector(D %*% truex)
## solve it
  sol <- kaczmarz(list(f1,f2,f3,f4),R)
## verify that the solution solves the system Dx = R
  sqrt(sum((D %*% sol - R)^2))
## but the solution is not equal to the true x, because the system is
## underdetermined
  sqrt(sum((sol - truex)^2))
## moreover, the solution from kaczmarz has smaller norm
  sqrt(sum(sol^2)) < sqrt(sum(truex^2))




