library(checkarg)


### Name: isStrictlyNegativeNumberOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrInfScalar

### ** Examples

isStrictlyNegativeNumberOrInfScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




