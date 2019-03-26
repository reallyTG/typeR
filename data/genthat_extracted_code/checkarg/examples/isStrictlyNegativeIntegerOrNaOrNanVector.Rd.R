library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaOrNanVector

### ** Examples

isStrictlyNegativeIntegerOrNaOrNanVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaOrNanVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




