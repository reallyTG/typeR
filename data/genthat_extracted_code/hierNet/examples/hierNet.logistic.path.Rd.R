library(hierNet)


### Name: hierNet.logistic.path
### Title: Fit a path of logistic hierNet models- lasso models with
###   interactions
### Aliases: hierNet.logistic.path

### ** Examples

set.seed(12)
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)
y=x[,1]+2*x[,2]+ x[,1]*x[,2]+3*rnorm(100)
y=1*(y>0)
fit=hierNet.logistic.path(x,y)
print(fit)



