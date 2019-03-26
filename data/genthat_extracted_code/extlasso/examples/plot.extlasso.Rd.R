library(extlasso)


### Name: plot.extlasso
### Title: Plot of regularization path
### Aliases: plot.extlasso
### Keywords: LASSO Elastic net Penalized Regularized L1 norm Jacobi
###   Regression Generalized linear models Gradient descent

### ** Examples

x=matrix(rnorm(100*30),100,30)
y=rnorm(100)
g1=extlasso(x,y,family="normal")
plot(g1)
plot(g1,xvar="lambda")
x=matrix(rnorm(100*30),100,30)
y=sample(c(0,1),100,replace=TRUE)
g1=extlasso(x,y,family="binomial")
plot(g1)
plot(g1,xvar="lambda")



