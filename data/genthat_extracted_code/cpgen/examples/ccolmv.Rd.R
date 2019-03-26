library(cpgen)


### Name: ccolmv
### Title: Colwise means or variances
### Aliases: ccolmv
### Keywords: Tools

### ** Examples


X <- matrix(rnorm(1000*500),1000,500)
means <- ccolmv(X)
vars <- ccolmv(X,compute_var=TRUE)




