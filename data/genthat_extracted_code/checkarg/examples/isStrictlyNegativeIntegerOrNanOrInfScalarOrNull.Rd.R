library(checkarg)


### Name: isStrictlyNegativeIntegerOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNanOrInfScalarOrNull

### ** Examples

isStrictlyNegativeIntegerOrNanOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNanOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




