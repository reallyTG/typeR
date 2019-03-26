library(checkarg)


### Name: isStrictlyPositiveIntegerOrNaOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNaOrInfScalarOrNull

### ** Examples

isStrictlyPositiveIntegerOrNaOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNaOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNaOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNaOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




