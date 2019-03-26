library(rfPermute)


### Name: exptdErrRate
### Title: Expected Error Rate
### Aliases: exptdErrRate

### ** Examples

data(mtcars)

rf <- randomForest(factor(am) ~ ., mtcars)
exptdErrRate(rf)




