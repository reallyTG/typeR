library(checkarg)


### Name: isNumberScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberScalar

### ** Examples

isNumberScalar(2)
   # returns TRUE (argument is valid)
isNumberScalar("X")
   # returns FALSE (argument is invalid)
#isNumberScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




