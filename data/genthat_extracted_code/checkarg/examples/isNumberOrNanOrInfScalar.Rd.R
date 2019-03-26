library(checkarg)


### Name: isNumberOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNanOrInfScalar

### ** Examples

isNumberOrNanOrInfScalar(2)
   # returns TRUE (argument is valid)
isNumberOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNumberOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNanOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




