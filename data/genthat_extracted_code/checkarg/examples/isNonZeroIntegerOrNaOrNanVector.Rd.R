library(checkarg)


### Name: isNonZeroIntegerOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaOrNanVector

### ** Examples

isNonZeroIntegerOrNaOrNanVector(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




