library(checkarg)


### Name: isNegativeIntegerOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNanOrInfVectorOrNull

### ** Examples

isNegativeIntegerOrNanOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNanOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




