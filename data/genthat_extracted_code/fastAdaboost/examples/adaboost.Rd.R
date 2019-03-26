library(fastAdaboost)


### Name: adaboost
### Title: Adaboost.M1 algorithm
### Aliases: adaboost

### ** Examples

fakedata <- data.frame( X=c(rnorm(100,0,1),rnorm(100,1,1)), Y=c(rep(0,100),rep(1,100) ) )
fakedata$Y <- factor(fakedata$Y)
test_adaboost <- adaboost(Y~X, data=fakedata,10)



