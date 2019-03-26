library(checkarg)


### Name: isPositiveIntegerOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNanVectorOrNull

### ** Examples

isPositiveIntegerOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




