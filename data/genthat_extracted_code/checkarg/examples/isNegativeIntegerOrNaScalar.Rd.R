library(checkarg)


### Name: isNegativeIntegerOrNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaScalar

### ** Examples

isNegativeIntegerOrNaScalar(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




