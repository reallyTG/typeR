library(checkarg)


### Name: isNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrNanScalar

### ** Examples

isNaOrNanScalar(NA)
   # returns TRUE (argument is valid)
isNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrNanScalar(NA, default = NaN)
   # returns NA (the argument, rather than the default, since it is not NULL)
#isNaOrNanScalar("X", default = NaN)
   # throws exception with message defined by message and argumentName parameters
isNaOrNanScalar(NULL, default = NaN)
   # returns NaN (the default, rather than the argument, since it is NULL)




