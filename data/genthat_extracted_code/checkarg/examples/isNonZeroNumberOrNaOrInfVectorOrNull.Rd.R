library(checkarg)


### Name: isNonZeroNumberOrNaOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaOrInfVectorOrNull

### ** Examples

isNonZeroNumberOrNaOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




