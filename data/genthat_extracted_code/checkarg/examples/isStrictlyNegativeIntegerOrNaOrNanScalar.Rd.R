library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaOrNanScalar

### ** Examples

isStrictlyNegativeIntegerOrNaOrNanScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaOrNanScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




