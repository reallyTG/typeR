library(checkarg)


### Name: isNegativeIntegerOrNaOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaOrNanOrInfScalarOrNull

### ** Examples

isNegativeIntegerOrNaOrNanOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaOrNanOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




