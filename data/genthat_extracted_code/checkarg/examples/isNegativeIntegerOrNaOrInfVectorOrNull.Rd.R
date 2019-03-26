library(checkarg)


### Name: isNegativeIntegerOrNaOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaOrInfVectorOrNull

### ** Examples

isNegativeIntegerOrNaOrInfVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrInfVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaOrInfVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrInfVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




