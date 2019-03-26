library(checkarg)


### Name: isNegativeNumberOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrInfVectorOrNull

### ** Examples

isNegativeNumberOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




