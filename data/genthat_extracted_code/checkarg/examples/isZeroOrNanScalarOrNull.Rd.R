library(checkarg)


### Name: isZeroOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNanScalarOrNull

### ** Examples

isZeroOrNanScalarOrNull(0)
   # returns TRUE (argument is valid)
isZeroOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isZeroOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNanScalarOrNull(0, default = NaN)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNanScalarOrNull("X", default = NaN)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNanScalarOrNull(NULL, default = NaN)
   # returns NaN (the default, rather than the argument, since it is NULL)




