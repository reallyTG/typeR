library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaOrNanScalarOrNull

### ** Examples

isStrictlyNegativeIntegerOrNaOrNanScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaOrNanScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




