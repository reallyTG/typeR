library(checkarg)


### Name: isIntegerOrNaOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrInfScalar

### ** Examples

isIntegerOrNaOrInfScalar(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




