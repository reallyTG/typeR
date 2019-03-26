library(checkarg)


### Name: isPositiveNumberOrNaOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaOrNanOrInfScalarOrNull

### ** Examples

isPositiveNumberOrNaOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




