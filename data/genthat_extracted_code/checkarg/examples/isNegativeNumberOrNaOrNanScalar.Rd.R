library(checkarg)


### Name: isNegativeNumberOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrNanScalar

### ** Examples

isNegativeNumberOrNaOrNanScalar(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrNanScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




