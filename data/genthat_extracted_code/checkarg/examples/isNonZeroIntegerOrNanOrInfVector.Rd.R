library(checkarg)


### Name: isNonZeroIntegerOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNanOrInfVector

### ** Examples

isNonZeroIntegerOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




