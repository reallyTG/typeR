library(checkarg)


### Name: isPositiveIntegerOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrInfVector

### ** Examples

isPositiveIntegerOrInfVector(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrInfVector("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




