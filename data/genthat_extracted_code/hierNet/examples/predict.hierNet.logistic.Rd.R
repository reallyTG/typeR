library(hierNet)


### Name: predict.hierNet.logistic
### Title: Prediction function for hierNet.logistic.
### Aliases: predict.hierNet.logistic

### ** Examples

set.seed(12)
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)
y=x[,1]+2*x[,2]+ x[,1]*x[,2]+3*rnorm(100)
y=1*(y>0)
newx=matrix(rnorm(100*10),ncol=10)
fit=hierNet.logistic(x,y,lam=5)
yhat=predict(fit,newx)

fit=hierNet.logistic.path(x,y)
yhat=predict(fit,newx)



