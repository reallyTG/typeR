library(checkarg)


### Name: isStrictlyPositiveIntegerOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrInfVector

### ** Examples

isStrictlyPositiveIntegerOrInfVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




