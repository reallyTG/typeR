library(glmnet)


### Name: print.glmnet
### Title: print a glmnet object
### Aliases: print.glmnet
### Keywords: models regression

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
fit1=glmnet(x,y)
print(fit1)



