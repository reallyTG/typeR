library(checkarg)


### Name: isZeroOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNanScalar

### ** Examples

isZeroOrNanScalar(0)
   # returns TRUE (argument is valid)
isZeroOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isZeroOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNanScalar(0, default = NaN)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNanScalar("X", default = NaN)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNanScalar(NULL, default = NaN)
   # returns NaN (the default, rather than the argument, since it is NULL)




