library(checkarg)


### Name: isPositiveIntegerVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerVector

### ** Examples

isPositiveIntegerVector(2)
   # returns TRUE (argument is valid)
isPositiveIntegerVector("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




