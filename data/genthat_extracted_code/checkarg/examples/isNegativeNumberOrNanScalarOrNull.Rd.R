library(checkarg)


### Name: isNegativeNumberOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNanScalarOrNull

### ** Examples

isNegativeNumberOrNanScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNanScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




