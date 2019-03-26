library(nnlasso)


### Name: plot.nnlasso
### Title: Plot of regularization path
### Aliases: plot.nnlasso
### Keywords: LASSO Elastic net Penalized Regularized L1 norm Jacobi
###   Regression Generalized linear models Gradient descent Non-negativity

### ** Examples

data(car)
attach(car)
x=as.matrix(car[,1:10])
g1=nnlasso(x,y,family="normal")
plot(g1)
plot(g1,xvar="lambda")
g1=nnlasso(x,y1,family="binomial")
plot(g1)
plot(g1,xvar="lambda")
detach(car)



