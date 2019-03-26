library(extlasso)


### Name: extlasso
### Title: Entire regularization path of penalized generalized linear model
###   for normal/binomial/poisson family using modified Jacobi Algorithm
### Aliases: extlasso
### Keywords: LASSO L1 penalty Elastic net Generalized linear model
###   Regression Ridge regression Regularization

### ** Examples

#LASSO
x=matrix(rnorm(100*30),100,30)
y=rnorm(100)
g1=extlasso(x,y,family="normal")
plot(g1)
plot(g1,xvar="lambda")

#Elastic net
g2=extlasso(x,y,family="normal",tau=0.6)
plot(g2)
plot(g2,xvar="lambda")

#Ridge regression
g3=extlasso(x,y,family="normal",tau=0)
plot(g3)
plot(g3,xvar="lambda")

#L1 penalized GLM for binomial family
x=matrix(rnorm(100*30),100,30)
y=sample(c(0,1),100,replace=TRUE)
g1=extlasso(x,y,family="binomial")
plot(g1)
plot(g1,xvar="lambda")

#Elastic net with GLM with binomial family
g2=extlasso(x,y,family="binomial",tau=0.8)
plot(g2)
plot(g2,xvar="lambda")



