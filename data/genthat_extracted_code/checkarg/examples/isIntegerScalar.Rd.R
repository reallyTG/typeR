library(checkarg)


### Name: isIntegerScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerScalar

### ** Examples

isIntegerScalar(2)
   # returns TRUE (argument is valid)
isIntegerScalar("X")
   # returns FALSE (argument is invalid)
#isIntegerScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




