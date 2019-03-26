library(grpss)


### Name: distcor
### Title: Compute the distance correlation
### Aliases: distcor

### ** Examples

X <- matrix(rnorm(200),ncol = 2)
y <- X%*%matrix(c(1.5,4),ncol = 1) + rnorm(100) # univariate y
distcor(X,y)

X <- iris[1:50, 1:4]
Y <- iris[51:100, 1:4]   # multiple response y
distcor(X,Y)



