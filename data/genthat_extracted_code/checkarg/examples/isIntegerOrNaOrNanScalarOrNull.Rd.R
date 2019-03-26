library(checkarg)


### Name: isIntegerOrNaOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrNanScalarOrNull

### ** Examples

isIntegerOrNaOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




