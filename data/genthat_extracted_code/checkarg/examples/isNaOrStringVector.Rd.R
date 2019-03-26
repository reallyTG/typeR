library(checkarg)


### Name: isNaOrStringVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrStringVector

### ** Examples

isNaOrStringVector("X")
   # returns TRUE (argument is valid)
isNaOrStringVector(1)
   # returns FALSE (argument is invalid)
#isNaOrStringVector(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrStringVector("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNaOrStringVector(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNaOrStringVector(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




