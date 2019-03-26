library(checkarg)


### Name: isNonZeroIntegerOrNaOrNanOrInfVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaOrNanOrInfVector

### ** Examples

isNonZeroIntegerOrNaOrNanOrInfVector(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaOrNanOrInfVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaOrNanOrInfVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanOrInfVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaOrNanOrInfVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanOrInfVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




