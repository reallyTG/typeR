library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaOrNanOrInfScalarOrNull

### ** Examples

isStrictlyNegativeIntegerOrNaOrNanOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaOrNanOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




