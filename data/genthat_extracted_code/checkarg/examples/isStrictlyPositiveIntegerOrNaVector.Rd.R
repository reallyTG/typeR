library(checkarg)


### Name: isStrictlyPositiveIntegerOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNaVector

### ** Examples

isStrictlyPositiveIntegerOrNaVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNaVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNaVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




