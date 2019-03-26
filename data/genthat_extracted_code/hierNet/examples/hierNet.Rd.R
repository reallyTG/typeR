library(hierNet)


### Name: hierNet
### Title: A Lasso for interactions
### Aliases: hierNet

### ** Examples

set.seed(12)
# fit a single hierNet model
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)
y=x[,1]+2*x[,2]+ x[,1]*x[,2]+3*rnorm(100)
fit=hierNet(x,y,lam=50)
print(fit)

# try strong (rather than weak) hierarchy
fit=hierNet(x,y,lam=50, strong=TRUE)
print(fit)

# a typical analysis including cross-validation
set.seed(12)
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)
y=x[,1]+2*x[,2]+ x[,1]*x[,2]+3*rnorm(100)
fit=hierNet.path(x,y)
fitcv=hierNet.cv(fit,x,y)
print(fitcv)

lamhat=fitcv$lamhat.1se
fit2=hierNet(x,y,lam=lamhat)
yhat=predict(fit2,x)



