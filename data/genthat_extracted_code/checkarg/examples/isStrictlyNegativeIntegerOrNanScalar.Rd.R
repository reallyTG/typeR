library(checkarg)


### Name: isStrictlyNegativeIntegerOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNanScalar

### ** Examples

isStrictlyNegativeIntegerOrNanScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNanScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




