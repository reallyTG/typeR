library(checkarg)


### Name: isPositiveNumberScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberScalar

### ** Examples

isPositiveNumberScalar(2)
   # returns TRUE (argument is valid)
isPositiveNumberScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




