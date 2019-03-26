library(checkarg)


### Name: isNumberOrNaOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaOrNanOrInfVector

### ** Examples

isNumberOrNaOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isNumberOrNaOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




