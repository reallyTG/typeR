library(checkarg)


### Name: isPositiveNumberOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaVector

### ** Examples

isPositiveNumberOrNaVector(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaVector("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




