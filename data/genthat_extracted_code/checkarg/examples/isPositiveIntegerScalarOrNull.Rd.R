library(checkarg)


### Name: isPositiveIntegerScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerScalarOrNull

### ** Examples

isPositiveIntegerScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




