library(checkarg)


### Name: isNumberOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNanOrInfVector

### ** Examples

isNumberOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isNumberOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNumberOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




