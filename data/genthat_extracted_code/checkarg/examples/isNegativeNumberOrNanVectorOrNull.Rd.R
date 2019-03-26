library(checkarg)


### Name: isNegativeNumberOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNanVectorOrNull

### ** Examples

isNegativeNumberOrNanVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNanVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




