library(checkarg)


### Name: isPositiveNumberOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaOrNanVectorOrNull

### ** Examples

isPositiveNumberOrNaOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




