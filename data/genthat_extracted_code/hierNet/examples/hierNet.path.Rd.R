library(hierNet)


### Name: hierNet.path
### Title: Fit a path of hierNet models- lasso models with interactions
### Aliases: hierNet.path

### ** Examples

set.seed(12)
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)
y=x[,1]+2*x[,2]+ x[,1]*x[,2]+3*rnorm(100)
fit=hierNet.path(x,y)
print(fit)



