library(checkarg)


### Name: isNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNanVector

### ** Examples

isNanVector(NaN)
   # returns TRUE (argument is valid)
isNanVector("X")
   # returns FALSE (argument is invalid)
#isNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




