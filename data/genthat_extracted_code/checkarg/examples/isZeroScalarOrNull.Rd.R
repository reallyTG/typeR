library(checkarg)


### Name: isZeroScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroScalarOrNull

### ** Examples

isZeroScalarOrNull(0)
   # returns TRUE (argument is valid)
isZeroScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isZeroScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




