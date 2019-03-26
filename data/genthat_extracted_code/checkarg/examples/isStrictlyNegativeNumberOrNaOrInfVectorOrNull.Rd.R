library(checkarg)


### Name: isStrictlyNegativeNumberOrNaOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaOrInfVectorOrNull

### ** Examples

isStrictlyNegativeNumberOrNaOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




