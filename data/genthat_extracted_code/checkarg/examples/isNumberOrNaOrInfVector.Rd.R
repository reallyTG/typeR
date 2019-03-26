library(checkarg)


### Name: isNumberOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaOrInfVector

### ** Examples

isNumberOrNaOrInfVector(2)
   # returns TRUE (argument is valid)
isNumberOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




