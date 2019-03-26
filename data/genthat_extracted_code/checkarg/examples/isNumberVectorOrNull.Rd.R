library(checkarg)


### Name: isNumberVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberVectorOrNull

### ** Examples

isNumberVectorOrNull(2)
   # returns TRUE (argument is valid)
isNumberVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




