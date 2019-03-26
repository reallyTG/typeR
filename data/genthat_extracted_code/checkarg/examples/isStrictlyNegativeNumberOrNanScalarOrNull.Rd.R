library(checkarg)


### Name: isStrictlyNegativeNumberOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNanScalarOrNull

### ** Examples

isStrictlyNegativeNumberOrNanScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNanScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




