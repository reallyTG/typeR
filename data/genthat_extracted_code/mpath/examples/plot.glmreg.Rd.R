library(mpath)


### Name: plot.glmreg
### Title: plot coefficients from a "glmreg" object
### Aliases: plot.glmreg
### Keywords: models regression

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
fit1=glmreg(x,y)
plot(fit1)
plot(fit1,xvar="lambda",label=TRUE)



