library(checkarg)


### Name: isNumberScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberScalarOrNull

### ** Examples

isNumberScalarOrNull(2)
   # returns TRUE (argument is valid)
isNumberScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




