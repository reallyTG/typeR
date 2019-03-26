library(checkarg)


### Name: isNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaScalarOrNull

### ** Examples

isNaScalarOrNull(NA)
   # returns TRUE (argument is valid)
isNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




