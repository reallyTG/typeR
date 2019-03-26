library(checkarg)


### Name: isNegativeNumberOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNanOrInfScalarOrNull

### ** Examples

isNegativeNumberOrNanOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNanOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




