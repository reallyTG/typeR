library(checkarg)


### Name: isNegativeIntegerOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaScalarOrNull

### ** Examples

isNegativeIntegerOrNaScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




