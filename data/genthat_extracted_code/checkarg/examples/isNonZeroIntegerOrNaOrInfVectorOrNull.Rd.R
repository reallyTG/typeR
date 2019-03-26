library(checkarg)


### Name: isNonZeroIntegerOrNaOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaOrInfVectorOrNull

### ** Examples

isNonZeroIntegerOrNaOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




