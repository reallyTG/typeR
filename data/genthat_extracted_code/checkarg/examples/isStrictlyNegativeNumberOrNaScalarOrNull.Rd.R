library(checkarg)


### Name: isStrictlyNegativeNumberOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaScalarOrNull

### ** Examples

isStrictlyNegativeNumberOrNaScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




