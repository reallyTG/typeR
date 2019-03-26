library(checkarg)


### Name: isStrictlyPositiveNumberOrNaOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaOrNanOrInfVector

### ** Examples

isStrictlyPositiveNumberOrNaOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




