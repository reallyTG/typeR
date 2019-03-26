library(checkarg)


### Name: isNegativeNumberOrNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaScalar

### ** Examples

isNegativeNumberOrNaScalar(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




