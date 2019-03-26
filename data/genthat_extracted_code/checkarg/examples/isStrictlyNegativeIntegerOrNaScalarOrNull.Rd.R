library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaScalarOrNull

### ** Examples

isStrictlyNegativeIntegerOrNaScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




