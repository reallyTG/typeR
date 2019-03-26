library(checkarg)


### Name: isNonZeroIntegerOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaScalarOrNull

### ** Examples

isNonZeroIntegerOrNaScalarOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




