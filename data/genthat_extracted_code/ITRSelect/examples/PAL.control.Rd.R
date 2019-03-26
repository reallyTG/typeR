library(ITRSelect)


### Name: PAL.control
### Title: Control parameters for penalized A-learning
### Aliases: PAL.control

### ** Examples

## No test: 
set.seed(12345)
n <- 200
p <- 200
X <- matrix(rnorm(n*p), nrow=n, ncol=p)
A <- rbinom(n, 1, 0.5)
CX <- (X[,1] + X[,2])
h <- 1 + X[,1] * X[,3]
Y <- h + A*CX + 0.5*rnorm(n)
result <- SAS(Y~X|A, pi1.est=0.5)
## End(No test)



