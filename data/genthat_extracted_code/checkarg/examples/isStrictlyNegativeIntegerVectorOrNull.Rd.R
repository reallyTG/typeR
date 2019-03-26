library(checkarg)


### Name: isStrictlyNegativeIntegerVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerVectorOrNull

### ** Examples

isStrictlyNegativeIntegerVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




