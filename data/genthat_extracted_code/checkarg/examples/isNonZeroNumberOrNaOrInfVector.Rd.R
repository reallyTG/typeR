library(checkarg)


### Name: isNonZeroNumberOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaOrInfVector

### ** Examples

isNonZeroNumberOrNaOrInfVector(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




