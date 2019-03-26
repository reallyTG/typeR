library(corpcor)


### Name: mpower
### Title: Compute the Power of a Real Symmetric Matrix
### Aliases: mpower
### Keywords: algebra

### ** Examples

# load corpcor library
library("corpcor")

# generate symmetric matrix
p = 10
n = 20
X = matrix(rnorm(n*p), nrow = n, ncol = p)
m = cor(X)

m %*% m
mpower(m, 2)

solve(m)
mpower(m, -1)

msq = mpower(m, 0.5)
msq %*% msq
m

mpower(m, 1.234)



