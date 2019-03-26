library(checkarg)


### Name: isStrictlyPositiveIntegerOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNaOrInfVector

### ** Examples

isStrictlyPositiveIntegerOrNaOrInfVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNaOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




