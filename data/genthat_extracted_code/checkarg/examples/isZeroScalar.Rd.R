library(checkarg)


### Name: isZeroScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroScalar

### ** Examples

isZeroScalar(0)
   # returns TRUE (argument is valid)
isZeroScalar("X")
   # returns FALSE (argument is invalid)
#isZeroScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




