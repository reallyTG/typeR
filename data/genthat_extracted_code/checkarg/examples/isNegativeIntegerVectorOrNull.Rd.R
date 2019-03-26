library(checkarg)


### Name: isNegativeIntegerVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerVectorOrNull

### ** Examples

isNegativeIntegerVectorOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




