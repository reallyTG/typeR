library(checkarg)


### Name: isNonZeroNumberOrNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaVectorOrNull

### ** Examples

isNonZeroNumberOrNaVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




