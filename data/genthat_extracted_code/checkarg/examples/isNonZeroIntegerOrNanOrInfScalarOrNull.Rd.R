library(checkarg)


### Name: isNonZeroIntegerOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNanOrInfScalarOrNull

### ** Examples

isNonZeroIntegerOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




