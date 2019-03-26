library(glmnet)


### Name: plot.glmnet
### Title: plot coefficients from a "glmnet" object
### Aliases: plot.glmnet plot.multnet plot.mrelnet
### Keywords: models regression

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
g2=sample(1:2,100,replace=TRUE)
g4=sample(1:4,100,replace=TRUE)
fit1=glmnet(x,y)
plot(fit1)
plot(fit1,xvar="lambda",label=TRUE)
fit3=glmnet(x,g4,family="multinomial")
plot(fit3,pch=19)



