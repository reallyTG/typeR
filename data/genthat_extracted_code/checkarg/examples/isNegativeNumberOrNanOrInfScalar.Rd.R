library(checkarg)


### Name: isNegativeNumberOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNanOrInfScalar

### ** Examples

isNegativeNumberOrNanOrInfScalar(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNanOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




