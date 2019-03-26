library(checkarg)


### Name: isNonZeroNumberOrNaOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaOrInfScalar

### ** Examples

isNonZeroNumberOrNaOrInfScalar(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




