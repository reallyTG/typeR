library(rODE)


### Name: getErrorCode
### Title: getErrorCode
### Aliases: getErrorCode

### ** Examples

setMethod("getErrorCode", "DormandPrince45", function(object) {
return(object@error_code)
})



