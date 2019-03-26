library(checkarg)


### Name: isIntegerScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerScalarOrNull

### ** Examples

isIntegerScalarOrNull(2)
   # returns TRUE (argument is valid)
isIntegerScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




