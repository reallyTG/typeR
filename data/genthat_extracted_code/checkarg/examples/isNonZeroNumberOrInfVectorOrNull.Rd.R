library(checkarg)


### Name: isNonZeroNumberOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrInfVectorOrNull

### ** Examples

isNonZeroNumberOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




