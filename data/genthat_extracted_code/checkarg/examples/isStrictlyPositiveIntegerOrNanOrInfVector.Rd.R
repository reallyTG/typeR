library(checkarg)


### Name: isStrictlyPositiveIntegerOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNanOrInfVector

### ** Examples

isStrictlyPositiveIntegerOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




