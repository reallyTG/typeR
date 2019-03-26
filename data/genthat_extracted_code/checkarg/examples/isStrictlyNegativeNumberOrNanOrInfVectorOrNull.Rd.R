library(checkarg)


### Name: isStrictlyNegativeNumberOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNanOrInfVectorOrNull

### ** Examples

isStrictlyNegativeNumberOrNanOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNanOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




