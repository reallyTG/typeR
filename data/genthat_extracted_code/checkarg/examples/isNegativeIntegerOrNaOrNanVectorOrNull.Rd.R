library(checkarg)


### Name: isNegativeIntegerOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaOrNanVectorOrNull

### ** Examples

isNegativeIntegerOrNaOrNanVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaOrNanVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




