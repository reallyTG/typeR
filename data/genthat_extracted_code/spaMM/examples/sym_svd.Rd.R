library(spaMM)


### Name: sym_eigen
### Title: Singular Value Decomposition of a Symmetric Matrix
### Aliases: sym_eigen
### Keywords: ~kwd1 ~kwd2

### ** Examples

 hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
 X <- hilbert(9)
 s <- sym_eigen(X)
 range(s$vectors %*% diag(s$values) %*% t(s$vectors) - X) # X=U D U'



