library(checkarg)


### Name: isStrictlyNegativeNumberOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNanOrInfScalarOrNull

### ** Examples

isStrictlyNegativeNumberOrNanOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNanOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




