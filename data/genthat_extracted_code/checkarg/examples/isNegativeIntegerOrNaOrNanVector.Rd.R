library(checkarg)


### Name: isNegativeIntegerOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeIntegerOrNaOrNanVector

### ** Examples

isNegativeIntegerOrNaOrNanVector(-2)
   # returns TRUE (argument is valid)
isNegativeIntegerOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNegativeIntegerOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeIntegerOrNaOrNanVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeIntegerOrNaOrNanVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




