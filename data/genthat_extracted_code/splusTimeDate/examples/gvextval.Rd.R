library(splusTimeDate)


### Name: groupVecExtValid
### Title: 'groupVec' Extended Class Validation
### Aliases: groupVecExtValid
### Keywords: methods

### ** Examples

setClass("myclass", representation(a = "numeric"), contains="groupVec",
   prototype=prototype(names="nums", classes="numeric",
      columns=list(numeric(0)), a=numeric(0)))
setValidity("myclass",  
   function(object) groupVecExtValid(object, "nums", "numeric", FALSE)) 
obj <- new("myclass") 
obj@a <- 1:5 
validObject(obj) 
groupVecExtValid(obj, "nums", "numeric", TRUE) 



