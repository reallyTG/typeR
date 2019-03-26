library(checkarg)


### Name: isNegativeNumberScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberScalar

### ** Examples

isNegativeNumberScalar(-2)
   # returns TRUE (argument is valid)
isNegativeNumberScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




