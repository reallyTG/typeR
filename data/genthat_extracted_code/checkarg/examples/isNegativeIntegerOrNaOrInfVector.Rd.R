library(checkarg)


### Name: isNegativeIntegerOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaOrInfVector

### ** Examples

isNegativeIntegerOrNaOrInfVector(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




