library(checkarg)


### Name: isNegativeNumberOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNanOrInfVectorOrNull

### ** Examples

isNegativeNumberOrNanOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNanOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




