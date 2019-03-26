library(checkarg)


### Name: isNegativeNumberOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrInfScalar

### ** Examples

isNegativeNumberOrInfScalar(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




