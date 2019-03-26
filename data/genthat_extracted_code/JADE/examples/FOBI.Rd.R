library(JADE)


### Name: FOBI
### Title: Function to perform FOBI for ICA
### Aliases: FOBI
### Keywords: multivariate

### ** Examples

# 3 source and 3 signals

S <- cbind(rt(1000, 4), rnorm(1000), runif(1000))
A <- matrix(rnorm(9), ncol = 3)
X <- S %*% t(A)
res<-FOBI(X)
MD(coef(res),A)



