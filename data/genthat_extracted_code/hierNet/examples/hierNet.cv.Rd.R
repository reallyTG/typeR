library(hierNet)


### Name: hierNet.cv
### Title: Cross-validation function for hierNet
### Aliases: hierNet.cv

### ** Examples

set.seed(12)
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)
y=x[,1]+2*x[,2]+ x[,1]*x[,2]+3*rnorm(100)
fit=hierNet.path(x,y)
fitcv=hierNet.cv(fit,x,y)
print(fitcv)
plot(fitcv)


x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)
y=x[,1]+2*x[,2]+ x[,1]*x[,2]+3*rnorm(100)
y=1*(y>0)
fit=hierNet.logistic.path(x,y)
fitcv=hierNet.cv(fit,x,y)
print(fitcv)
plot(fitcv)



