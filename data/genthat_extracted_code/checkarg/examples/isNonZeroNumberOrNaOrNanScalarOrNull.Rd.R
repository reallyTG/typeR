library(checkarg)


### Name: isNonZeroNumberOrNaOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaOrNanScalarOrNull

### ** Examples

isNonZeroNumberOrNaOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




