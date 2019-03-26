library(checkarg)


### Name: isStrictlyNegativeNumberScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberScalarOrNull

### ** Examples

isStrictlyNegativeNumberScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




