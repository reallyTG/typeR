library(checkarg)


### Name: isNumberOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaScalarOrNull

### ** Examples

isNumberOrNaScalarOrNull(2)
   # returns TRUE (argument is valid)
isNumberOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




