library(checkarg)


### Name: isStringVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStringVectorOrNull

### ** Examples

isStringVectorOrNull("X")
   # returns TRUE (argument is valid)
isStringVectorOrNull(1)
   # returns FALSE (argument is invalid)
#isStringVectorOrNull(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStringVectorOrNull("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isStringVectorOrNull(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isStringVectorOrNull(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




