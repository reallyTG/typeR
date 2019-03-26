library(checkarg)


### Name: isNegativeNumberOrNaOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrNanOrInfScalarOrNull

### ** Examples

isNegativeNumberOrNaOrNanOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrNanOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




