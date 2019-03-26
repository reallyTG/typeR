library(checkarg)


### Name: isNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaScalar

### ** Examples

isNaScalar(NA)
   # returns TRUE (argument is valid)
isNaScalar("X")
   # returns FALSE (argument is invalid)
#isNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




