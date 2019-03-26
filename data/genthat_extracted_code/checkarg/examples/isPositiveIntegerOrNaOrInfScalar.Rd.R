library(checkarg)


### Name: isPositiveIntegerOrNaOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNaOrInfScalar

### ** Examples

isPositiveIntegerOrNaOrInfScalar(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNaOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNaOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNaOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




