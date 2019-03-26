library(checkarg)


### Name: isPositiveIntegerOrNaOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNaOrNanOrInfScalar

### ** Examples

isPositiveIntegerOrNaOrNanOrInfScalar(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNaOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNaOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNaOrNanOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




