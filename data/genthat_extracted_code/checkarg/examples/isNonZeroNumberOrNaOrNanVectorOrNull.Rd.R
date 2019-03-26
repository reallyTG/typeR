library(checkarg)


### Name: isNonZeroNumberOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaOrNanVectorOrNull

### ** Examples

isNonZeroNumberOrNaOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




