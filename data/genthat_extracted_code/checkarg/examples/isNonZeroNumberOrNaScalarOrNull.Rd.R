library(checkarg)


### Name: isNonZeroNumberOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaScalarOrNull

### ** Examples

isNonZeroNumberOrNaScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




