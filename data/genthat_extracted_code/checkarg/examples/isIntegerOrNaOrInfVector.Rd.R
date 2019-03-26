library(checkarg)


### Name: isIntegerOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrInfVector

### ** Examples

isIntegerOrNaOrInfVector(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




