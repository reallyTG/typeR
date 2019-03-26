library(checkarg)


### Name: isNegativeNumberOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrInfVector

### ** Examples

isNegativeNumberOrNaOrInfVector(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




