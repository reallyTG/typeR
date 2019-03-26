library(checkarg)


### Name: isStringVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStringVector

### ** Examples

isStringVector("X")
   # returns TRUE (argument is valid)
isStringVector(1)
   # returns FALSE (argument is invalid)
#isStringVector(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStringVector("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isStringVector(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isStringVector(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




