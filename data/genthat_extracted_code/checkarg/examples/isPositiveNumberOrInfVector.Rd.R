library(checkarg)


### Name: isPositiveNumberOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrInfVector

### ** Examples

isPositiveNumberOrInfVector(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrInfVector("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




