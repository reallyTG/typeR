library(checkarg)


### Name: isNonZeroIntegerOrNaOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaOrNanScalarOrNull

### ** Examples

isNonZeroIntegerOrNaOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




