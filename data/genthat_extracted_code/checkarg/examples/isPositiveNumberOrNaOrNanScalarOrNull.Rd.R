library(checkarg)


### Name: isPositiveNumberOrNaOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaOrNanScalarOrNull

### ** Examples

isPositiveNumberOrNaOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




