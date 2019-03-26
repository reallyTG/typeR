library(checkarg)


### Name: isPositiveNumberOrNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaVectorOrNull

### ** Examples

isPositiveNumberOrNaVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




