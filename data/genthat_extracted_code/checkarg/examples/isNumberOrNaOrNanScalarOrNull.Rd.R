library(checkarg)


### Name: isNumberOrNaOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaOrNanScalarOrNull

### ** Examples

isNumberOrNaOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isNumberOrNaOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




