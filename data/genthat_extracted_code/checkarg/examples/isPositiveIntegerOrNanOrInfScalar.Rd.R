library(checkarg)


### Name: isPositiveIntegerOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNanOrInfScalar

### ** Examples

isPositiveIntegerOrNanOrInfScalar(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNanOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




