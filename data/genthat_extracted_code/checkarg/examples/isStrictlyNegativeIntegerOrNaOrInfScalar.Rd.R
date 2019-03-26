library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaOrInfScalar

### ** Examples

isStrictlyNegativeIntegerOrNaOrInfScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




