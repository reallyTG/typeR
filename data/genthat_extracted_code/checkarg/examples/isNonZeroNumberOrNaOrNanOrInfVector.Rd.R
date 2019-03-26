library(checkarg)


### Name: isNonZeroNumberOrNaOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaOrNanOrInfVector

### ** Examples

isNonZeroNumberOrNaOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




