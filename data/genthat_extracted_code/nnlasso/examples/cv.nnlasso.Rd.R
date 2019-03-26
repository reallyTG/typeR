library(nnlasso)


### Name: cv.nnlasso
### Title: k-fold cross validation for penalized generalized linear models
###   for normal/binomial/poisson family
### Aliases: cv.nnlasso
### Keywords: Crossvalidation

### ** Examples

#normal family
data(car)
attach(car)
x=as.matrix(car[,1:10])
## Not run: cv.nnlasso(x,y,family="normal",k=5)
#binomial family with same data
## Not run: cv.nnlasso(x,y1,family="binomial",k=5)
detach(car)

#poisson family
x=matrix(rnorm(100*30),100,30)
y=sample(c(1:5),100,replace=TRUE)
## Not run: cv.nnlasso(x,y,family="poisson",k=5)



