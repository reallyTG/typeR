library(checkarg)


### Name: isStrictlyNegativeIntegerOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNanOrInfVector

### ** Examples

isStrictlyNegativeIntegerOrNanOrInfVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNanOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




