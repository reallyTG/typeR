library(checkarg)


### Name: isStrictlyPositiveNumberOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrInfScalarOrNull

### ** Examples

isStrictlyPositiveNumberOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




