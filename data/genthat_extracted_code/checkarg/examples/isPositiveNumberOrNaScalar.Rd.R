library(checkarg)


### Name: isPositiveNumberOrNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaScalar

### ** Examples

isPositiveNumberOrNaScalar(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




