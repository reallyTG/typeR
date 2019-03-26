library(checkarg)


### Name: isStrictlyPositiveIntegerOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNanOrInfScalarOrNull

### ** Examples

isStrictlyPositiveIntegerOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




