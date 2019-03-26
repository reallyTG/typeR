library(checkarg)


### Name: isNonZeroIntegerVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerVectorOrNull

### ** Examples

isNonZeroIntegerVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




