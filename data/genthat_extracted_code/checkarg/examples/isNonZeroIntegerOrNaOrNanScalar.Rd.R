library(checkarg)


### Name: isNonZeroIntegerOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaOrNanScalar

### ** Examples

isNonZeroIntegerOrNaOrNanScalar(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




