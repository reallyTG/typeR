library(nnlasso)


### Name: predict.nnlasso
### Title: Prediction of coefficients of a penalized linear regression or
###   generalized linear models
### Aliases: predict.nnlasso

### ** Examples

data(car)
attach(car)
x=as.matrix(car[,1:10])
g1=nnlasso(x,y1,family="binomial")
predict(g1,mode="lambda",at=0.1)
predict(g1,mode="L1norm",at=1)
predict(g1,mode="fraction",at=0.5)
g1=nnlasso(x,y,family="normal")
predict(g1,mode="lambda",at=0.09)
predict(g1,mode="L1norm",at=0.6)
predict(g1,mode="fraction",at=0.8)
detach(car)



