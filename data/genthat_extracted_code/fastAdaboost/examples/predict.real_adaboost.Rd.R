library(fastAdaboost)


### Name: predict.real_adaboost
### Title: predict method for real_adaboost objects
### Aliases: predict.real_adaboost

### ** Examples

fakedata <- data.frame( X=c(rnorm(100,0,1),rnorm(100,1,1)), Y=c(rep(0,100),rep(1,100) ) )
fakedata$Y <- factor(fakedata$Y)
test_real_adaboost <- real_adaboost(Y~X, fakedata, 10)
pred <- predict(test_real_adaboost,newdata=fakedata)
print(pred$error)
print( table(pred$class,fakedata$Y) )




