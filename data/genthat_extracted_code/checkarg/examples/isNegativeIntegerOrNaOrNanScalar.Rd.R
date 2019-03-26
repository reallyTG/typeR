library(checkarg)


### Name: isNegativeIntegerOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaOrNanScalar

### ** Examples

isNegativeIntegerOrNaOrNanScalar(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaOrNanScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




