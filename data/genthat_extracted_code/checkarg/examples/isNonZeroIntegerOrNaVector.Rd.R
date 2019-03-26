library(checkarg)


### Name: isNonZeroIntegerOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaVector

### ** Examples

isNonZeroIntegerOrNaVector(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




