library(checkarg)


### Name: isNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNanScalarOrNull

### ** Examples

isNanScalarOrNull(NaN)
   # returns TRUE (argument is valid)
isNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




