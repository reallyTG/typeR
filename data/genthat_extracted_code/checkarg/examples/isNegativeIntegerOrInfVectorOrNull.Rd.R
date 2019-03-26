library(checkarg)


### Name: isNegativeIntegerOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrInfVectorOrNull

### ** Examples

isNegativeIntegerOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




