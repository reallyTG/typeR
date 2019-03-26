library(checkarg)


### Name: isNonZeroNumberOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNanOrInfScalarOrNull

### ** Examples

isNonZeroNumberOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




