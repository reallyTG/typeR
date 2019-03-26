library(extlasso)


### Name: extlasso.normal
### Title: Entire regularization path of penalized generalized linear model
###   for normal family using modified Jacobi Algorithm
### Aliases: extlasso.normal
### Keywords: internal

### ** Examples

x=matrix(rnorm(100*30),100,30)
y=rnorm(100)
g1=extlasso.normal(x,y)
plot(g1)
plot(g1,xvar="lambda")
g1$of.value



