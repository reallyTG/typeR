library(checkarg)


### Name: isPositiveIntegerOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNaOrNanVectorOrNull

### ** Examples

isPositiveIntegerOrNaOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNaOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




