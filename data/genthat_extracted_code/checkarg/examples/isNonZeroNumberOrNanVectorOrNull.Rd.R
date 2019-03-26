library(checkarg)


### Name: isNonZeroNumberOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNanVectorOrNull

### ** Examples

isNonZeroNumberOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




