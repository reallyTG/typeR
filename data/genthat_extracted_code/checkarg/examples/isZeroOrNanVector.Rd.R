library(checkarg)


### Name: isZeroOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNanVector

### ** Examples

isZeroOrNanVector(0)
   # returns TRUE (argument is valid)
isZeroOrNanVector("X")
   # returns FALSE (argument is invalid)
#isZeroOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNanVector(0, default = NaN)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNanVector("X", default = NaN)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNanVector(NULL, default = NaN)
   # returns NaN (the default, rather than the argument, since it is NULL)




