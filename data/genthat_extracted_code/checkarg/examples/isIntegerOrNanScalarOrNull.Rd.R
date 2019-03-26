library(checkarg)


### Name: isIntegerOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNanScalarOrNull

### ** Examples

isIntegerOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isIntegerOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




