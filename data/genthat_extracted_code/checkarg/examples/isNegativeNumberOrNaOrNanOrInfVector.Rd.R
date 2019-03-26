library(checkarg)


### Name: isNegativeNumberOrNaOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrNanOrInfVector

### ** Examples

isNegativeNumberOrNaOrNanOrInfVector(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrNanOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




