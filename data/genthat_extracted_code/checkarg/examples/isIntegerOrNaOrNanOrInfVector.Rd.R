library(checkarg)


### Name: isIntegerOrNaOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrNanOrInfVector

### ** Examples

isIntegerOrNaOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




