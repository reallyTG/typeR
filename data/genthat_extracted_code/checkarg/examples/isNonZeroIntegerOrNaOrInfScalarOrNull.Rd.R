library(checkarg)


### Name: isNonZeroIntegerOrNaOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaOrInfScalarOrNull

### ** Examples

isNonZeroIntegerOrNaOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




