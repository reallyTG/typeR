library(checkarg)


### Name: isStrictlyNegativeNumberScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberScalar

### ** Examples

isStrictlyNegativeNumberScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




