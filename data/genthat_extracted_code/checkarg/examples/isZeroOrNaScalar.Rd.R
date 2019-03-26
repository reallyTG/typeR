library(checkarg)


### Name: isZeroOrNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNaScalar

### ** Examples

isZeroOrNaScalar(0)
   # returns TRUE (argument is valid)
isZeroOrNaScalar("X")
   # returns FALSE (argument is invalid)
#isZeroOrNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaScalar(0, default = NA)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNaScalar("X", default = NA)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaScalar(NULL, default = NA)
   # returns NA (the default, rather than the argument, since it is NULL)




