library(checkarg)


### Name: isNonZeroNumberScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberScalar

### ** Examples

isNonZeroNumberScalar(2)
   # returns TRUE (argument is valid)
isNonZeroNumberScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




