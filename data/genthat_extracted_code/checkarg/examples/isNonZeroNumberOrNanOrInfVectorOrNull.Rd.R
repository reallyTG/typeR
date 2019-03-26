library(checkarg)


### Name: isNonZeroNumberOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNanOrInfVectorOrNull

### ** Examples

isNonZeroNumberOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




