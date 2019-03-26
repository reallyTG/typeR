library(checkarg)


### Name: isStrictlyNegativeNumberOrNaOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaOrNanOrInfScalar

### ** Examples

isStrictlyNegativeNumberOrNaOrNanOrInfScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaOrNanOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




