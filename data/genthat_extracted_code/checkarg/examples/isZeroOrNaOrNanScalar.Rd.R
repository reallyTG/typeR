library(checkarg)


### Name: isZeroOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNaOrNanScalar

### ** Examples

isZeroOrNaOrNanScalar(0)
   # returns TRUE (argument is valid)
isZeroOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isZeroOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaOrNanScalar(0, default = NA)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNaOrNanScalar("X", default = NA)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaOrNanScalar(NULL, default = NA)
   # returns NA (the default, rather than the argument, since it is NULL)




