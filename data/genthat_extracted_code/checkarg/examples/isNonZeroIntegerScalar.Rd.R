library(checkarg)


### Name: isNonZeroIntegerScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerScalar

### ** Examples

isNonZeroIntegerScalar(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




