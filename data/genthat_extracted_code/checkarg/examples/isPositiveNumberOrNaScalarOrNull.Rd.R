library(checkarg)


### Name: isPositiveNumberOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaScalarOrNull

### ** Examples

isPositiveNumberOrNaScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




