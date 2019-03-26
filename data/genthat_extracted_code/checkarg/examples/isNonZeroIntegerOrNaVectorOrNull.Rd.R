library(checkarg)


### Name: isNonZeroIntegerOrNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaVectorOrNull

### ** Examples

isNonZeroIntegerOrNaVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




