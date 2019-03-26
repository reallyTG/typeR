library(rstiefel)


### Name: rbmf.vector.gibbs
### Title: Gibbs Sampling for the Vector-variate Bingham-von Mises-Fisher
###   Distribution
### Aliases: rbmf.vector.gibbs

### ** Examples


## The function is currently defined as
function (A, c, x) 
{
    evdA <- eigen(A)
    E <- evdA$vec
    l <- evdA$val
    y <- t(E) %*% x
    d <- t(E) %*% c
    x <- E %*% ry_bmf(y, l, d)
    x/sqrt(sum(x^2))
  }




