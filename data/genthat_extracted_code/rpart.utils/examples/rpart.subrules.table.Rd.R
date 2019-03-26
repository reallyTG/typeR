library(rpart.utils)


### Name: rpart.subrules.table
### Title: Returns an unpivoted table of variable values (factor levels)
###   associated with each branch.
### Aliases: rpart.subrules.table

### ** Examples

library(rpart)
fit<-rpart(Reliability~.,data=car.test.frame)
rpart.subrules.table(fit)



