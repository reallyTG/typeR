library(checkarg)


### Name: isNegativeNumberOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrNanVectorOrNull

### ** Examples

isNegativeNumberOrNaOrNanVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrNanVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




