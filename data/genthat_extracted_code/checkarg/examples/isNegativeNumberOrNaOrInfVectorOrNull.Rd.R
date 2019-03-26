library(checkarg)


### Name: isNegativeNumberOrNaOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrInfVectorOrNull

### ** Examples

isNegativeNumberOrNaOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




