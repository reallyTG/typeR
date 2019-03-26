library(extlasso)


### Name: predict.extlasso
### Title: Prediction of coefficients of a penalized linear regression or
###   generalized linear models
### Aliases: predict.extlasso

### ** Examples

x=matrix(rnorm(100*30),100,30)
y=sample(c(0,1),100,replace=TRUE)
g1=extlasso(x,y,family="binomial")
predict(g1,mode="lambda",at=0.1)
predict(g1,mode="L1norm",at=1)
predict(g1,mode="fraction",at=0.5)
x=matrix(rnorm(100*30),100,30)
y=rnorm(100)
g1=extlasso(x,y,family="normal")
predict(g1,mode="lambda",at=0.09)
predict(g1,mode="L1norm",at=0.6)
predict(g1,mode="fraction",at=0.8)



