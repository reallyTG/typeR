library(checkarg)


### Name: isIntegerOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaScalarOrNull

### ** Examples

isIntegerOrNaScalarOrNull(2)
   # returns TRUE (argument is valid)
isIntegerOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




