library(extlasso)


### Name: extlasso.poisson
### Title: Entire regularization path of penalized generalized linear model
###   for poisson family using modified Jacobi Algorithm
### Aliases: extlasso.poisson
### Keywords: internal

### ** Examples

x=matrix(rnorm(100*30),100,30)
y=sample(c(1:5),100,replace=TRUE)
g1=extlasso.poisson(x,y)
plot(g1)
plot(g1,xvar="lambda")
g1$of.value



