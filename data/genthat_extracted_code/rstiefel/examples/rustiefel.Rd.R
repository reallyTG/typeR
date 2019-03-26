library(rstiefel)


### Name: rustiefel
### Title: Siumlate a Uniformly Distributed Random Orthonormal Matrix
### Aliases: rustiefel

### ** Examples


## The function is currently defined as
function (m, R) 
{
    X <- matrix(rnorm(m * R), m, R)
    tmp <- eigen(t(X) %*% X)
    X %*% (tmp$vec %*% sqrt(diag(1/tmp$val, nrow = R)) %*% t(tmp$vec))
  }




