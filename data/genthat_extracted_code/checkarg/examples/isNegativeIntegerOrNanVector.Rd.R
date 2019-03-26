library(checkarg)


### Name: isNegativeIntegerOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNanVector

### ** Examples

isNegativeIntegerOrNanVector(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNanVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNanVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




