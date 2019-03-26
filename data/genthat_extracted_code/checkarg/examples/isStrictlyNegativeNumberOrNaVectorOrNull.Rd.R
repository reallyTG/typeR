library(checkarg)


### Name: isStrictlyNegativeNumberOrNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaVectorOrNull

### ** Examples

isStrictlyNegativeNumberOrNaVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




