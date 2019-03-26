library(checkarg)


### Name: isPositiveNumberOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrInfScalar

### ** Examples

isPositiveNumberOrInfScalar(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




