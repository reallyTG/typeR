library(checkarg)


### Name: isNegativeNumberOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNanScalar

### ** Examples

isNegativeNumberOrNanScalar(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNanScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




