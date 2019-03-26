library(checkarg)


### Name: isStrictlyNegativeIntegerOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNanOrInfVectorOrNull

### ** Examples

isStrictlyNegativeIntegerOrNanOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNanOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




