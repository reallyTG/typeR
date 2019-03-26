library(checkarg)


### Name: isNegativeIntegerOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNanOrInfScalarOrNull

### ** Examples

isNegativeIntegerOrNanOrInfScalarOrNull(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanOrInfScalarOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNanOrInfScalarOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanOrInfScalarOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




