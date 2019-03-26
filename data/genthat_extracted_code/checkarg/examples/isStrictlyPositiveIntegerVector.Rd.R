library(checkarg)


### Name: isStrictlyPositiveIntegerVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerVector

### ** Examples

isStrictlyPositiveIntegerVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




