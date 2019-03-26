library(checkarg)


### Name: isIntegerOrNaOrNanOrInfScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrNanOrInfScalarOrNull

### ** Examples

isIntegerOrNaOrNanOrInfScalarOrNull(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrNanOrInfScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrNanOrInfScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanOrInfScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrNanOrInfScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanOrInfScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




