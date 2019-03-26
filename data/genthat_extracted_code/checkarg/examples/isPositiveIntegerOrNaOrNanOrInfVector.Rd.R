library(checkarg)


### Name: isPositiveIntegerOrNaOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNaOrNanOrInfVector

### ** Examples

isPositiveIntegerOrNaOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNaOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNaOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNaOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




