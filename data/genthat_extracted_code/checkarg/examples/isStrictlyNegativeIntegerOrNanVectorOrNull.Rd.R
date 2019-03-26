library(checkarg)


### Name: isStrictlyNegativeIntegerOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNanVectorOrNull

### ** Examples

isStrictlyNegativeIntegerOrNanVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNanVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




