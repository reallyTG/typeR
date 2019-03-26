library(checkarg)


### Name: isNumberOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaOrNanScalar

### ** Examples

isNumberOrNaOrNanScalar(2)
   # returns TRUE (argument is valid)
isNumberOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




