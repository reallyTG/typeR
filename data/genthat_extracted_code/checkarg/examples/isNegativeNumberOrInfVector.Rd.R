library(checkarg)


### Name: isNegativeNumberOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrInfVector

### ** Examples

isNegativeNumberOrInfVector(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




