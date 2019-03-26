library(checkarg)


### Name: isStrictlyNegativeIntegerOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNanVector

### ** Examples

isStrictlyNegativeIntegerOrNanVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNanVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNanVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




