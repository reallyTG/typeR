library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaOrNanOrInfVector

### ** Examples

isStrictlyNegativeIntegerOrNaOrNanOrInfVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanOrInfVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaOrNanOrInfVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanOrInfVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




