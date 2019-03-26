library(nnlasso)


### Name: nnlasso
### Title: Entire regularization path of non-negative penalized generalized
###   linear model for normal/binomial/poisson family using multiplicative
###   iterative algorithm
### Aliases: nnlasso
### Keywords: LASSO L1 penalty Elastic net Generalized linear model
###   Regression Ridge regression Regularization Non-negativity
###   Non-negative

### ** Examples

#Non-negative LASSO
data(car)
attach(car)
x=as.matrix(car[,1:10])
g1=nnlasso(x,y,family="normal")
plot(g1)
plot(g1,xvar="lambda")


#Non-negative Elastic net with same data
## Not run: 
##D g2=nnlasso(x,y,family="normal",tau=0.6)
##D plot(g2)
##D plot(g2,xvar="lambda")
## End(Not run)

#Non-negative Ridge regression with same data
## Not run: 
##D g3=nnlasso(x,y,family="normal",tau=0)
##D plot(g3)
##D plot(g3,xvar="lambda")
## End(Not run)

#Non-negative L1 penalized GLM for binomial family
## Not run: 
##D g1=nnlasso(x,y1,family="binomial")
##D plot(g1)
##D plot(g1,xvar="lambda")
## End(Not run)

#Non-negative Elastic net with GLM with binomial family
## Not run: 
##D g2=nnlasso(x,y1,family="binomial",tau=0.8)
##D plot(g2)
##D plot(g2,xvar="lambda")
## End(Not run)

#coefficient estimates for a particular lambda for normal family
g1=nnlasso(x,y,lambda=0.01,family="normal",path=FALSE,SE=TRUE)
coef(g1)
round(g1$se,3)


#coefficient estimates for a particular lambda for binomial family
## Not run: 
##D g2=nnlasso(x,y1,lambda=0.01,family="binomial",path=FALSE,SE=TRUE)
##D coef(g2)
##D round(g2$se,3)
##D detach(car)
## End(Not run)



