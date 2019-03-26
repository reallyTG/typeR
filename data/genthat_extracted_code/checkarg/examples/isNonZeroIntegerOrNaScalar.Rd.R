library(checkarg)


### Name: isNonZeroIntegerOrNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaScalar

### ** Examples

isNonZeroIntegerOrNaScalar(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




