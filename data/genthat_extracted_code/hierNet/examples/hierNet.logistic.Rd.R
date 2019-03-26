library(hierNet)


### Name: hierNet.logistic
### Title: A logistic regression Lasso for interactions
### Aliases: hierNet.logistic

### ** Examples

set.seed(12)
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)
y=x[,1]+2*x[,2]+ x[,1]*x[,2]+3*rnorm(100)
y=1*(y>0)
fit=hierNet.logistic(x,y,lam=5)
print(fit)



