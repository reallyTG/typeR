library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaOrNanVectorOrNull

### ** Examples

isStrictlyNegativeIntegerOrNaOrNanVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaOrNanVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




