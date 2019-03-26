library(extlasso)


### Name: cv.normal
### Title: k-fold cross validation for penalized generalized linear models
###   for normal family
### Aliases: cv.normal
### Keywords: internal

### ** Examples

x=matrix(rnorm(100*30),100,30)
y=rnorm(100)
cv.normal(x,y,k=10)



