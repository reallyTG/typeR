library(extlasso)


### Name: cv.poisson
### Title: k-fold cross validation for penalized generalized linear models
###   for poisson family
### Aliases: cv.poisson
### Keywords: internal

### ** Examples

x=matrix(rnorm(100*30),100,30)
y=sample(c(1:5),100,replace=TRUE)
cv.poisson(x,y,k=5)



