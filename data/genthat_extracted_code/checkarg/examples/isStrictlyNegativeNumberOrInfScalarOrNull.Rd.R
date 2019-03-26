library(checkarg)


### Name: isStrictlyNegativeNumberOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrInfScalarOrNull

### ** Examples

isStrictlyNegativeNumberOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




