library(checkarg)


### Name: isNonEmptyStringVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonEmptyStringVector

### ** Examples

isNonEmptyStringVector("X")
   # returns TRUE (argument is valid)
isNonEmptyStringVector(1)
   # returns FALSE (argument is invalid)
#isNonEmptyStringVector(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonEmptyStringVector("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNonEmptyStringVector(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNonEmptyStringVector(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




