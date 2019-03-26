library(checkarg)


### Name: isNaOrNonEmptyStringVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrNonEmptyStringVector

### ** Examples

isNaOrNonEmptyStringVector("X")
   # returns TRUE (argument is valid)
isNaOrNonEmptyStringVector(1)
   # returns FALSE (argument is invalid)
#isNaOrNonEmptyStringVector(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrNonEmptyStringVector("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNaOrNonEmptyStringVector(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNaOrNonEmptyStringVector(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




