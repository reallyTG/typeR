library(checkarg)


### Name: isNonZeroNumberOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrInfVector

### ** Examples

isNonZeroNumberOrInfVector(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




