library(checkarg)


### Name: isPositiveNumberOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNanOrInfVector

### ** Examples

isPositiveNumberOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




