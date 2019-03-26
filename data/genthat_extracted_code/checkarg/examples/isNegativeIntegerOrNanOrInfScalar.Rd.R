library(checkarg)


### Name: isNegativeIntegerOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNanOrInfScalar

### ** Examples

isNegativeIntegerOrNanOrInfScalar(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNanOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




