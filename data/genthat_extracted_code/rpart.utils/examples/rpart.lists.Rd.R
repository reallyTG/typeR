library(rpart.utils)


### Name: rpart.lists
### Title: Creates lists of variable values (factor levels) associated with
###   each rule in an 'rpart' object.
### Aliases: rpart.lists

### ** Examples

library(rpart)
fit<-rpart(Reliability~.,data=car.test.frame)
rpart.lists(fit)



