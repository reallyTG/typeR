library(checkarg)


### Name: isNegativeIntegerOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNanScalar

### ** Examples

isNegativeIntegerOrNanScalar(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNanScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




