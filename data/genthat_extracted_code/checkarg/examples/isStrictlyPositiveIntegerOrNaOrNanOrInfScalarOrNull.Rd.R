library(checkarg)


### Name: isStrictlyPositiveIntegerOrNaOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNaOrNanOrInfScalarOrNull

### ** Examples

isStrictlyPositiveIntegerOrNaOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNaOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNaOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNaOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




