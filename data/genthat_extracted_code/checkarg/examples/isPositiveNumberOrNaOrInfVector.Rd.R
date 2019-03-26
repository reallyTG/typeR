library(checkarg)


### Name: isPositiveNumberOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaOrInfVector

### ** Examples

isPositiveNumberOrNaOrInfVector(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




