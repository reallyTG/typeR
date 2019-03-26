library(checkarg)


### Name: isNonZeroIntegerOrNaOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaOrInfVector

### ** Examples

isNonZeroIntegerOrNaOrInfVector(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




