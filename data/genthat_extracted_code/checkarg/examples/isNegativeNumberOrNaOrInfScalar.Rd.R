library(checkarg)


### Name: isNegativeNumberOrNaOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrInfScalar

### ** Examples

isNegativeNumberOrNaOrInfScalar(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




