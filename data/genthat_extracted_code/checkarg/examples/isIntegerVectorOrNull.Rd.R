library(checkarg)


### Name: isIntegerVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerVectorOrNull

### ** Examples

isIntegerVectorOrNull(2)
   # returns TRUE (argument is valid)
isIntegerVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




