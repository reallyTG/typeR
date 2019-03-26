library(pre)


### Name: predict.pre
### Title: Predicted values based on final unbiased prediction rule
###   ensemble
### Aliases: predict.pre

### ** Examples

## No test: 
set.seed(1)
train <- sample(1:sum(complete.cases(airquality)), size = 100)
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),][train,])
predict(airq.ens)
predict(airq.ens, newdata = airquality[complete.cases(airquality),][-train,])
## End(No test)



