library(splusTimeDate)


### Name: groupVecColumn
### Title: 'groupVec' Class - Data Access
### Aliases: groupVecColumn groupVecColumn<-
### Keywords: methods

### ** Examples

obj <- new("groupVec") 
groupVecNames(obj) <- "colname1" 
groupVecColumn(obj, "colname1") <- c(1, 2, 3) 
groupVecColumn(obj, "colname1") 
#[1] 1 2 3



