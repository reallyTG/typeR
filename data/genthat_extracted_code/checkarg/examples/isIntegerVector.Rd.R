library(checkarg)


### Name: isIntegerVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerVector

### ** Examples

isIntegerVector(2)
   # returns TRUE (argument is valid)
isIntegerVector("X")
   # returns FALSE (argument is invalid)
#isIntegerVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




