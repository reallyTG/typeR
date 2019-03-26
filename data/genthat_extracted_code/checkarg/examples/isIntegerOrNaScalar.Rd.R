library(checkarg)


### Name: isIntegerOrNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaScalar

### ** Examples

isIntegerOrNaScalar(2)
   # returns TRUE (argument is valid)
isIntegerOrNaScalar("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




