library(checkarg)


### Name: isStrictlyNegativeIntegerVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerVector

### ** Examples

isStrictlyNegativeIntegerVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




