library(checkarg)


### Name: isStrictlyNegativeNumberOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNanScalar

### ** Examples

isStrictlyNegativeNumberOrNanScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNanScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNanScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




