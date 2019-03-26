library(fda)


### Name: checkLogicalInteger
### Title: Does an argument satisfy required conditions?
### Aliases: checkLogical checkNumeric checkLogicalInteger
### Keywords: attribute utilities

### ** Examples

##
## checkLogical
##
checkLogical(NULL, length=3, warnOnly=TRUE)
checkLogical(c(FALSE, TRUE, TRUE), length=4, warnOnly=TRUE)
checkLogical(c(FALSE, TRUE, TRUE), length=3)

##
## checkNumeric
##
checkNumeric(NULL, lower=1, upper=3)
checkNumeric(1:3, 1, 3)
checkNumeric(1:3, 1, 3, inclusion=FALSE, warnOnly=TRUE)
checkNumeric(pi, 1, 4, integer=TRUE, warnOnly=TRUE)
checkNumeric(c(1, 1), 1, 4, warnOnly=TRUE)
checkNumeric(c(1, 1), 1, 4, unique=FALSE, warnOnly=TRUE)

##
## checkLogicalInteger
##
checkLogicalInteger(NULL, 3)
checkLogicalInteger(c(FALSE, TRUE), warnOnly=TRUE) 
checkLogicalInteger(1:2, 3) 
checkLogicalInteger(2, warnOnly=TRUE) 
checkLogicalInteger(c(2, 4), 3, warnOnly=TRUE)

##
## checkLogicalInteger names its calling function 
## rather than itself as the location of error detection
## if possible
##
tstFun <- function(x, length., warnOnly=FALSE){
   checkLogicalInteger(x, length., warnOnly) 
}
tstFun(NULL, 3)
tstFun(4, 3, warnOnly=TRUE)

tstFun2 <- function(x, length., warnOnly=FALSE){
   tstFun(x, length., warnOnly)
}
tstFun2(4, 3, warnOnly=TRUE)




