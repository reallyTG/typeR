library(tensorBSS)


### Name: tFOBI
### Title: FOBI for Tensor-Valued Observations
### Aliases: tFOBI
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

MD(tfobi$W[[1]], A1)
MD(tfobi$W[[2]], A2) 
tMD(tfobi$W, list(A1, A2))

# Digit data example

library(ElemStatLearn)
x <- zip.train

rows <- which(x[, 1] == 0 | x[, 1] == 1)
x0 <- x[rows, 2:257]
y0 <- x[rows, 1] + 1

x0 <- t(x0)
dim(x0) <- c(16, 16, 2199)

tfobi <- tFOBI(x0)
plot(tfobi, col=y0)



