library(checkarg)


### Name: isPositiveNumberOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrInfScalarOrNull

### ** Examples

isPositiveNumberOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




