library(checkarg)


### Name: isNegativeNumberOrNaOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrNanOrInfVectorOrNull

### ** Examples

isNegativeNumberOrNaOrNanOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrNanOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




