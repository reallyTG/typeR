library(checkarg)


### Name: isIntegerOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNanScalar

### ** Examples

isIntegerOrNanScalar(2)
   # returns TRUE (argument is valid)
isIntegerOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




