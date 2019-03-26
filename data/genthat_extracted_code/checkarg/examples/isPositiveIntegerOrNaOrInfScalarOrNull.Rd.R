library(checkarg)


### Name: isPositiveIntegerOrNaOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNaOrInfScalarOrNull

### ** Examples

isPositiveIntegerOrNaOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNaOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNaOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNaOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




