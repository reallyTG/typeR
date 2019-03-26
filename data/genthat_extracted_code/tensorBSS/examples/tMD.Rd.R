library(tensorBSS)


### Name: tMD
### Title: Minimum Distance Index of a Kronecker Product
### Aliases: tMD
### Keywords: multivariate array

### ** Examples

n <- 1000
S <- t(cbind(rexp(n)-1,
             rnorm(n),
             runif(n, -sqrt(3), sqrt(3)),
             rt(n,5)*sqrt(0.6),
             (rchisq(n,1)-1)/sqrt(2),
             (rchisq(n,2)-2)/sqrt(4)))

dim(S) <- c(3, 2, n)

A1 <- matrix(rnorm(9), 3, 3)
A2 <- matrix(rnorm(4), 2, 2)

X <- tensorTransform(S, A1, 1)
X <- tensorTransform(X, A2, 2)

tfobi <- tFOBI(X)

MD(tfobi$W[[2]] %x% tfobi$W[[1]], A2 %x% A1)
tMD(list(tfobi$W[[2]]), list(A2))



