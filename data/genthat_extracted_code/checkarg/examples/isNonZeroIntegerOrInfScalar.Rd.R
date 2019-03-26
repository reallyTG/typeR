library(checkarg)


### Name: isNonZeroIntegerOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrInfScalar

### ** Examples

isNonZeroIntegerOrInfScalar(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




