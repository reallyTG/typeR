library(checkarg)


### Name: isNegativeIntegerOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrInfScalar

### ** Examples

isNegativeIntegerOrInfScalar(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




