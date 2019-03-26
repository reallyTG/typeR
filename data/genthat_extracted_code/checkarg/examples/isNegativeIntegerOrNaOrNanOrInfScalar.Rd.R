library(checkarg)


### Name: isNegativeIntegerOrNaOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaOrNanOrInfScalar

### ** Examples

isNegativeIntegerOrNaOrNanOrInfScalar(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaOrNanOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




