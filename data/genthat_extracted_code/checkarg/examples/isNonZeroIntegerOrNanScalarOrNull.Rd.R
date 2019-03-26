library(checkarg)


### Name: isNonZeroIntegerOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNanScalarOrNull

### ** Examples

isNonZeroIntegerOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




