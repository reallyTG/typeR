library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaScalar

### ** Examples

isStrictlyNegativeIntegerOrNaScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




