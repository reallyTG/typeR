library(checkarg)


### Name: isPositiveIntegerOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNaOrInfVector

### ** Examples

isPositiveIntegerOrNaOrInfVector(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNaOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




