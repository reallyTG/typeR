library(checkarg)


### Name: isIntegerOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrInfVector

### ** Examples

isIntegerOrInfVector(2)
   # returns TRUE (argument is valid)
isIntegerOrInfVector("X")
   # returns FALSE (argument is invalid)
#isIntegerOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




