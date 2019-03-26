library(checkarg)


### Name: isIntegerOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNanOrInfScalarOrNull

### ** Examples

isIntegerOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isIntegerOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




