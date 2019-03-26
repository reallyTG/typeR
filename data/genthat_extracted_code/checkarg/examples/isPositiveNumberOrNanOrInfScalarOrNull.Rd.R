library(checkarg)


### Name: isPositiveNumberOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNanOrInfScalarOrNull

### ** Examples

isPositiveNumberOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




