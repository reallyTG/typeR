library(checkarg)


### Name: isIntegerOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNanOrInfVector

### ** Examples

isIntegerOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isIntegerOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




