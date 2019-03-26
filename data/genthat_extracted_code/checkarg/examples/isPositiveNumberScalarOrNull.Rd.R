library(checkarg)


### Name: isPositiveNumberScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberScalarOrNull

### ** Examples

isPositiveNumberScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




