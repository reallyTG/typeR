library(checkarg)


### Name: isNumberOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNanScalarOrNull

### ** Examples

isNumberOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isNumberOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




