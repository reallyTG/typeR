library(splusTimeDate)


### Name: groupVecNonVec
### Title: 'groupVec' Extended Class Validation
### Aliases: groupVecNonVec
### Keywords: methods

### ** Examples

setClass("myclass", representation("groupVec", a = "numeric")) 
obj <- new("myclass") 
groupVecNonVec(obj) 
obj@a <- 1:5 
groupVecNonVec(obj) 
groupVecNonVec(obj, "a") 



