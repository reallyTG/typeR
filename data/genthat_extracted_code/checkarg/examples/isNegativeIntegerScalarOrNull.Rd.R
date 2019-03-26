library(checkarg)


### Name: isNegativeIntegerScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerScalarOrNull

### ** Examples

isNegativeIntegerScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




