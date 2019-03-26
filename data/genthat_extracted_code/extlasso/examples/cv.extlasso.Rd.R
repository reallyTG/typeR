library(extlasso)


### Name: cv.extlasso
### Title: k-fold cross validation for penalized generalized linear models
###   for normal/binomial/poisson family
### Aliases: cv.extlasso
### Keywords: Crossvalidation

### ** Examples

#normal family
x=matrix(rnorm(100*30),100,30)
y=rnorm(100)
cv.extlasso(x,y,family="normal",k=5)

#binomial family
x=matrix(rnorm(100*30),100,30)
y=sample(c(0,1),100,replace=TRUE)
cv.extlasso(x,y,family="binomial",k=5)

#poisson family
x=matrix(rnorm(100*30),100,30)
y=sample(c(1:5),100,replace=TRUE)
cv.extlasso(x,y,family="poisson",k=5)



