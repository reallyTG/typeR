library(checkarg)


### Name: isNonZeroNumberOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNanOrInfScalar

### ** Examples

isNonZeroNumberOrNanOrInfScalar(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNanOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




