library(checkarg)


### Name: isNegativeNumberOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrInfScalarOrNull

### ** Examples

isNegativeNumberOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




