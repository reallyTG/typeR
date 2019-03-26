library(checkarg)


### Name: isNonZeroIntegerOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNanOrInfScalar

### ** Examples

isNonZeroIntegerOrNanOrInfScalar(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNanOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




