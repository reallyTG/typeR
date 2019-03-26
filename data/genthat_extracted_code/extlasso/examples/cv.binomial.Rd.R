library(extlasso)


### Name: cv.binomial
### Title: k-fold cross validation for penalized generalized linear models
###   for binomial family
### Aliases: cv.binomial
### Keywords: internal

### ** Examples

x=matrix(rnorm(100*30),100,30)
y=sample(c(0,1),100,replace=TRUE)
cv.binomial(x,y,k=5)



