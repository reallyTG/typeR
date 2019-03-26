library(checkarg)


### Name: isPositiveNumberOrNaOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaOrInfScalarOrNull

### ** Examples

isPositiveNumberOrNaOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




