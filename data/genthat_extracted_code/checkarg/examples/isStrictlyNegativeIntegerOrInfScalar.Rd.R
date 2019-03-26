library(checkarg)


### Name: isStrictlyNegativeIntegerOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrInfScalar

### ** Examples

isStrictlyNegativeIntegerOrInfScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




