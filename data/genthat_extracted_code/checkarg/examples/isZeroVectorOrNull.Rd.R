library(checkarg)


### Name: isZeroVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroVectorOrNull

### ** Examples

isZeroVectorOrNull(0)
   # returns TRUE (argument is valid)
isZeroVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isZeroVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




