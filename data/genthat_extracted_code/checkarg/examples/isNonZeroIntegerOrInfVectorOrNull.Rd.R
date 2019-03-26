library(checkarg)


### Name: isNonZeroIntegerOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrInfVectorOrNull

### ** Examples

isNonZeroIntegerOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




