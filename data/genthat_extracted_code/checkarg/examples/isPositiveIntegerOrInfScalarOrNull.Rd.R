library(checkarg)


### Name: isPositiveIntegerOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrInfScalarOrNull

### ** Examples

isPositiveIntegerOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




