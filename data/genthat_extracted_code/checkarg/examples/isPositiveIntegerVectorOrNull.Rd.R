library(checkarg)


### Name: isPositiveIntegerVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerVectorOrNull

### ** Examples

isPositiveIntegerVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




