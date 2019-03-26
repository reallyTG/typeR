library(corpcor)


### Name: fast.svd
### Title: Fast Singular Value Decomposition
### Aliases: fast.svd
### Keywords: algebra

### ** Examples

# load corpcor library
library("corpcor")


# generate a "fat" data matrix
n = 50
p = 5000
X = matrix(rnorm(n*p), n, p)

# compute SVD
system.time( (s1 = svd(X)) ) 
system.time( (s2 = fast.svd(X)) )


eps = 1e-10
sum(abs(s1$d-s2$d) > eps)
sum(abs(abs(s1$u)-abs(s2$u)) > eps)
sum(abs(abs(s1$v)-abs(s2$v)) > eps)



