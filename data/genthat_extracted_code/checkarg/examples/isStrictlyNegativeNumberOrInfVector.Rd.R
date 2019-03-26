library(checkarg)


### Name: isStrictlyNegativeNumberOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrInfVector

### ** Examples

isStrictlyNegativeNumberOrInfVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




