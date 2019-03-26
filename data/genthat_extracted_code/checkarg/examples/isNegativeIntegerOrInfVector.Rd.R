library(checkarg)


### Name: isNegativeIntegerOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrInfVector

### ** Examples

isNegativeIntegerOrInfVector(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




