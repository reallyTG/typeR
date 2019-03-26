library(checkarg)


### Name: isStrictlyNegativeNumberOrNaOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaOrInfScalar

### ** Examples

isStrictlyNegativeNumberOrNaOrInfScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




