library(checkarg)


### Name: isNegativeIntegerOrNaOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaOrInfScalarOrNull

### ** Examples

isNegativeIntegerOrNaOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




