library(checkarg)


### Name: isNonZeroIntegerOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrInfScalarOrNull

### ** Examples

isNonZeroIntegerOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




