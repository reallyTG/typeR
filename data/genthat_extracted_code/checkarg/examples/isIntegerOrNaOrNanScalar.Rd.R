library(checkarg)


### Name: isIntegerOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrNanScalar

### ** Examples

isIntegerOrNaOrNanScalar(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




