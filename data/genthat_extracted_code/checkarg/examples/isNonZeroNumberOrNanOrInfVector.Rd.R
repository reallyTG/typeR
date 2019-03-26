library(checkarg)


### Name: isNonZeroNumberOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNanOrInfVector

### ** Examples

isNonZeroNumberOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




