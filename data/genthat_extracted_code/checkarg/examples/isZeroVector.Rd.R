library(checkarg)


### Name: isZeroVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroVector

### ** Examples

isZeroVector(0)
   # returns TRUE (argument is valid)
isZeroVector("X")
   # returns FALSE (argument is invalid)
#isZeroVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




