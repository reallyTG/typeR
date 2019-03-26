library(checkarg)


### Name: isNonZeroIntegerOrNaOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaOrNanOrInfScalar

### ** Examples

isNonZeroIntegerOrNaOrNanOrInfScalar(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaOrNanOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




