library(checkarg)


### Name: isBooleanOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isBooleanOrNaVector

### ** Examples

isBooleanOrNaVector(FALSE)
   # returns TRUE (argument is valid)
isBooleanOrNaVector("X")
   # returns FALSE (argument is invalid)
#isBooleanOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanOrNaVector(FALSE, default = TRUE)
   # returns FALSE (the argument, rather than the default, since it is not NULL)
#isBooleanOrNaVector("X", default = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanOrNaVector(NULL, default = TRUE)
   # returns TRUE (the default, rather than the argument, since it is NULL)




