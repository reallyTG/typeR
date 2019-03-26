library(checkarg)


### Name: isNumberOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrInfScalar

### ** Examples

isNumberOrInfScalar(2)
   # returns TRUE (argument is valid)
isNumberOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNumberOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




