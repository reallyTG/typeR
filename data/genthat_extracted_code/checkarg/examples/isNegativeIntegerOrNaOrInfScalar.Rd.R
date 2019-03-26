library(checkarg)


### Name: isNegativeIntegerOrNaOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaOrInfScalar

### ** Examples

isNegativeIntegerOrNaOrInfScalar(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




