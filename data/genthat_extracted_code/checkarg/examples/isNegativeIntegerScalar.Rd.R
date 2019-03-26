library(checkarg)


### Name: isNegativeIntegerScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerScalar

### ** Examples

isNegativeIntegerScalar(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerScalar("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




