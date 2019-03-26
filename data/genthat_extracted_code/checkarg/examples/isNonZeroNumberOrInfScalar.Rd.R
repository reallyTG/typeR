library(checkarg)


### Name: isNonZeroNumberOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrInfScalar

### ** Examples

isNonZeroNumberOrInfScalar(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




