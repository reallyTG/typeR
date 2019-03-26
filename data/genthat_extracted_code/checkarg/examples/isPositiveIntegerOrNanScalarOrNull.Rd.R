library(checkarg)


### Name: isPositiveIntegerOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNanScalarOrNull

### ** Examples

isPositiveIntegerOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




