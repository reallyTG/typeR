library(checkarg)


### Name: isNumberOrNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaVectorOrNull

### ** Examples

isNumberOrNaVectorOrNull(2)
   # returns TRUE (argument is valid)
isNumberOrNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




