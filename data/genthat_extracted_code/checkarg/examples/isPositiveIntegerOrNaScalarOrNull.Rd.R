library(checkarg)


### Name: isPositiveIntegerOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNaScalarOrNull

### ** Examples

isPositiveIntegerOrNaScalarOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNaScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




