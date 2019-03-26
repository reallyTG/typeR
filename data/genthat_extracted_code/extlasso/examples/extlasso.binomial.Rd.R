library(extlasso)


### Name: extlasso.binomial
### Title: Entire regularization path of penalized generalized linear model
###   for binomial family using modified Jacobi Algorithm
### Aliases: extlasso.binomial
### Keywords: internal

### ** Examples

x=matrix(rnorm(100*30),100,30)
y=sample(c(0,1),100,replace=TRUE)
g1=extlasso.binomial(x,y)
plot(g1)
plot(g1,xvar="lambda")
g1$of.value



