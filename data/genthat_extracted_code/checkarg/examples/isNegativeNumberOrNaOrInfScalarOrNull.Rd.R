library(checkarg)


### Name: isNegativeNumberOrNaOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrInfScalarOrNull

### ** Examples

isNegativeNumberOrNaOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




