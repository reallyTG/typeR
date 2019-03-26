library(checkarg)


### Name: isNonZeroNumberOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaOrNanScalar

### ** Examples

isNonZeroNumberOrNaOrNanScalar(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




