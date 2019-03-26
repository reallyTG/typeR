library(checkarg)


### Name: isNegativeIntegerOrNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaVectorOrNull

### ** Examples

isNegativeIntegerOrNaVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




