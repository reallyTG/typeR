library(checkarg)


### Name: isNonZeroNumberOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNanScalarOrNull

### ** Examples

isNonZeroNumberOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




