library(checkarg)


### Name: isNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaVectorOrNull

### ** Examples

isNaVectorOrNull(NA)
   # returns TRUE (argument is valid)
isNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




