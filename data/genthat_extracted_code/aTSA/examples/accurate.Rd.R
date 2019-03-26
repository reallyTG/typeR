library(aTSA)


### Name: accurate
### Title: Accurate Computation
### Aliases: accurate

### ** Examples

X <- matrix(rnorm(200),100,2)
y <- 0.1*X[,1] + 2*X[,2] + rnorm(100)
y.hat <- fitted(lm(y ~ X))
accurate(y,y.hat,2)



