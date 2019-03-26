library(checkarg)


### Name: isStrictlyNegativeNumberOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNanVectorOrNull

### ** Examples

isStrictlyNegativeNumberOrNanVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNanVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




