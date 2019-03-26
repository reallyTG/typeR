library(checkarg)


### Name: isPositiveIntegerOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrInfScalar

### ** Examples

isPositiveIntegerOrInfScalar(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




