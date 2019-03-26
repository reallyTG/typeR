library(rpart.utils)


### Name: rpart.rules
### Title: Returns a list of strings summarizing the branch path to each
###   node.
### Aliases: rpart.rules

### ** Examples

library(rpart)
fit<-rpart(Reliability~.,data=car.test.frame)
rpart.rules(fit)



