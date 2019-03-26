library(rpart.utils)


### Name: rpart.rules.table
### Title: Returns an unpivoted table of branch paths (subrules) associated
###   with each node.
### Aliases: rpart.rules.table

### ** Examples

library(rpart)
fit<-rpart(Reliability~.,data=car.test.frame)
rpart.rules.table(fit)



