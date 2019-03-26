library(checkarg)


### Name: isNegativeIntegerOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNanScalarOrNull

### ** Examples

isNegativeIntegerOrNanScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNanScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




