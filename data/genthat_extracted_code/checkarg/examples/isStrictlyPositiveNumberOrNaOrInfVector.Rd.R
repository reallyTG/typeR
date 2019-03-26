library(checkarg)


### Name: isStrictlyPositiveNumberOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaOrInfVector

### ** Examples

isStrictlyPositiveNumberOrNaOrInfVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




