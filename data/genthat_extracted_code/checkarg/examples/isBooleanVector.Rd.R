library(checkarg)


### Name: isBooleanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isBooleanVector

### ** Examples

isBooleanVector(FALSE)
   # returns TRUE (argument is valid)
isBooleanVector("X")
   # returns FALSE (argument is invalid)
#isBooleanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanVector(FALSE, default = TRUE)
   # returns FALSE (the argument, rather than the default, since it is not NULL)
#isBooleanVector("X", default = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanVector(NULL, default = TRUE)
   # returns TRUE (the default, rather than the argument, since it is NULL)




