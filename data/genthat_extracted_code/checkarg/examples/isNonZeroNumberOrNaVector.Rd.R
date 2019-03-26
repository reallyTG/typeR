library(checkarg)


### Name: isNonZeroNumberOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaVector

### ** Examples

isNonZeroNumberOrNaVector(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




