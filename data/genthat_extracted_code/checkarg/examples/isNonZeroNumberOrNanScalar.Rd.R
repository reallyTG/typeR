library(checkarg)


### Name: isNonZeroNumberOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNanScalar

### ** Examples

isNonZeroNumberOrNanScalar(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




