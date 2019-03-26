library(checkarg)


### Name: isNonZeroIntegerScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerScalarOrNull

### ** Examples

isNonZeroIntegerScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




