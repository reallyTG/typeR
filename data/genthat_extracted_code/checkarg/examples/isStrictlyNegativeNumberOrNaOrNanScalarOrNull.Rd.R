library(checkarg)


### Name: isStrictlyNegativeNumberOrNaOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaOrNanScalarOrNull

### ** Examples

isStrictlyNegativeNumberOrNaOrNanScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaOrNanScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




