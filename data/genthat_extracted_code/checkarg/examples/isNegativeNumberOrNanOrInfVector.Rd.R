library(checkarg)


### Name: isNegativeNumberOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNanOrInfVector

### ** Examples

isNegativeNumberOrNanOrInfVector(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNanOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




