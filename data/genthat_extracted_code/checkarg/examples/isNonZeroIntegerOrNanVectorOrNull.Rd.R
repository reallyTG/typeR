library(checkarg)


### Name: isNonZeroIntegerOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNanVectorOrNull

### ** Examples

isNonZeroIntegerOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




