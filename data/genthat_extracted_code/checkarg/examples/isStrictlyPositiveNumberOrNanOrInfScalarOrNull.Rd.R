library(checkarg)


### Name: isStrictlyPositiveNumberOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNanOrInfScalarOrNull

### ** Examples

isStrictlyPositiveNumberOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




