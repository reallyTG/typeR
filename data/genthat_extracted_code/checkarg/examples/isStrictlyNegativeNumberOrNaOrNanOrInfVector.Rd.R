library(checkarg)


### Name: isStrictlyNegativeNumberOrNaOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaOrNanOrInfVector

### ** Examples

isStrictlyNegativeNumberOrNaOrNanOrInfVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaOrNanOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




