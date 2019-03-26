library(checkarg)


### Name: isPositiveNumberOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNanScalarOrNull

### ** Examples

isPositiveNumberOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




