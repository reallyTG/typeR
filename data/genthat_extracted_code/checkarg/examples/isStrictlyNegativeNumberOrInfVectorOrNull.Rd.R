library(checkarg)


### Name: isStrictlyNegativeNumberOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrInfVectorOrNull

### ** Examples

isStrictlyNegativeNumberOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




