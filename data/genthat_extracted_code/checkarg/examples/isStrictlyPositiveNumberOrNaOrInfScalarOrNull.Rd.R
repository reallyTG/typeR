library(checkarg)


### Name: isStrictlyPositiveNumberOrNaOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaOrInfScalarOrNull

### ** Examples

isStrictlyPositiveNumberOrNaOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




