library(checkarg)


### Name: isStrictlyNegativeIntegerScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerScalarOrNull

### ** Examples

isStrictlyNegativeIntegerScalarOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




