library(checkarg)


### Name: isStrictlyNegativeNumberOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaOrNanScalar

### ** Examples

isStrictlyNegativeNumberOrNaOrNanScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaOrNanScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




