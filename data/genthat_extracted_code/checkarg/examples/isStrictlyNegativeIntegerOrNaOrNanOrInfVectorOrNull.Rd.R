library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaOrNanOrInfVectorOrNull

### ** Examples

isStrictlyNegativeIntegerOrNaOrNanOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaOrNanOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




