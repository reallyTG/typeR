library(checkarg)


### Name: isStrictlyPositiveNumberOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaVector

### ** Examples

isStrictlyPositiveNumberOrNaVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




