library(glmnet)


### Name: deviance.glmnet
### Title: Extract the deviance from a glmnet object
### Aliases: deviance.glmnet
### Keywords: models regression

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
fit1=glmnet(x,y)
deviance(fit1)



