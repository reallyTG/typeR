library(checkarg)


### Name: isNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNanVectorOrNull

### ** Examples

isNanVectorOrNull(NaN)
   # returns TRUE (argument is valid)
isNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




