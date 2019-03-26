library(checkarg)


### Name: isStrictlyNegativeNumberOrNaOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaOrNanOrInfVectorOrNull

### ** Examples

isStrictlyNegativeNumberOrNaOrNanOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaOrNanOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




