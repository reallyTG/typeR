library(checkarg)


### Name: isNonZeroNumberOrNaOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaOrInfScalarOrNull

### ** Examples

isNonZeroNumberOrNaOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




