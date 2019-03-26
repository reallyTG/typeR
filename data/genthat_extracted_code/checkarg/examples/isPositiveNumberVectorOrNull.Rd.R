library(checkarg)


### Name: isPositiveNumberVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberVectorOrNull

### ** Examples

isPositiveNumberVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




