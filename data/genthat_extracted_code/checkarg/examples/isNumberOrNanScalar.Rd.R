library(checkarg)


### Name: isNumberOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNanScalar

### ** Examples

isNumberOrNanScalar(2)
   # returns TRUE (argument is valid)
isNumberOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNumberOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




