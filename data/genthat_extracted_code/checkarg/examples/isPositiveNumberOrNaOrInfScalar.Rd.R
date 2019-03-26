library(checkarg)


### Name: isPositiveNumberOrNaOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaOrInfScalar

### ** Examples

isPositiveNumberOrNaOrInfScalar(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




