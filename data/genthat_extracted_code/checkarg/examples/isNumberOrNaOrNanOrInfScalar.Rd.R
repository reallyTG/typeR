library(checkarg)


### Name: isNumberOrNaOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaOrNanOrInfScalar

### ** Examples

isNumberOrNaOrNanOrInfScalar(2)
   # returns TRUE (argument is valid)
isNumberOrNaOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaOrNanOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




