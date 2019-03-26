library(checkarg)


### Name: isStrictlyPositiveNumberOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrInfVector

### ** Examples

isStrictlyPositiveNumberOrInfVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




