library(rODE)


### Name: enableRuntimeExceptions
### Title: enableRuntimeExceptions
### Aliases: enableRuntimeExceptions

### ** Examples

setMethod("enableRuntimeExceptions", "DormandPrince45", function(object, enable) {
    object@enableExceptions <- enable
})



