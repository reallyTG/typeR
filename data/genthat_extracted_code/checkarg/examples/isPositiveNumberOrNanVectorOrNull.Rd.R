library(checkarg)


### Name: isPositiveNumberOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNanVectorOrNull

### ** Examples

isPositiveNumberOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




