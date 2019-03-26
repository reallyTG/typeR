library(checkarg)


### Name: isIntegerOrNaOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrNanOrInfScalar

### ** Examples

isIntegerOrNaOrNanOrInfScalar(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrNanOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




