library(checkarg)


### Name: isNonZeroIntegerOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNanVector

### ** Examples

isNonZeroIntegerOrNanVector(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




