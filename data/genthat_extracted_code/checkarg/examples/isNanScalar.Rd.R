library(checkarg)


### Name: isNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNanScalar

### ** Examples

isNanScalar(NaN)
   # returns TRUE (argument is valid)
isNanScalar("X")
   # returns FALSE (argument is invalid)
#isNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




