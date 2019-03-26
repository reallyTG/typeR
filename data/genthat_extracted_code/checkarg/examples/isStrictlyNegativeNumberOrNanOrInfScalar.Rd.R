library(checkarg)


### Name: isStrictlyNegativeNumberOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNanOrInfScalar

### ** Examples

isStrictlyNegativeNumberOrNanOrInfScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNanOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




