library(fastAdaboost)


### Name: print.real_adaboost
### Title: Print real adaboost model summary
### Aliases: print.real_adaboost

### ** Examples

fakedata <- data.frame( X=c(rnorm(100,0,1),rnorm(100,1,1)), Y=c(rep(0,100),rep(1,100) ) )
fakedata$Y <- factor(fakedata$Y)
test_real_adaboost<- real_adaboost(Y~X, fakedata, 10)
print(test_real_adaboost)



