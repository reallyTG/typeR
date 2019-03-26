library(checkarg)


### Name: isNegativeNumberScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberScalarOrNull

### ** Examples

isNegativeNumberScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




