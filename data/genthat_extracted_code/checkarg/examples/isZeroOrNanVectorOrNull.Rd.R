library(checkarg)


### Name: isZeroOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNanVectorOrNull

### ** Examples

isZeroOrNanVectorOrNull(0)
   # returns TRUE (argument is valid)
isZeroOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isZeroOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNanVectorOrNull(0, default = NaN)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNanVectorOrNull("X", default = NaN)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNanVectorOrNull(NULL, default = NaN)
   # returns NaN (the default, rather than the argument, since it is NULL)




