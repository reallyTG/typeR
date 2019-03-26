library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaVector

### ** Examples

isStrictlyNegativeIntegerOrNaVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




