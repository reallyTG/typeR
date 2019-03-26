library(checkarg)


### Name: isNonZeroIntegerVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerVector

### ** Examples

isNonZeroIntegerVector(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




