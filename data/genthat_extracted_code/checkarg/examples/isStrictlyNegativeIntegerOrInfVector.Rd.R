library(checkarg)


### Name: isStrictlyNegativeIntegerOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrInfVector

### ** Examples

isStrictlyNegativeIntegerOrInfVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




