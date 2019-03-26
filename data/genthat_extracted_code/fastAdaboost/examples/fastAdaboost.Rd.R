library(fastAdaboost)


### Name: fastAdaboost
### Title: fastAdaboost: fast adaboost implementation for R
### Aliases: fastAdaboost fastAdaboost-package

### ** Examples

fakedata <- data.frame( X=c(rnorm(100,0,1),rnorm(100,1,1)), Y=c(rep(0,100),rep(1,100) ) )
fakedata$Y <- factor(fakedata$Y)
test_adaboost <- adaboost(Y~X, fakedata, 10)
pred <- predict( test_adaboost,newdata=fakedata)
print(pred$error)




