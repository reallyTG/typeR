library(checkarg)


### Name: isStrictlyNegativeNumberVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberVector

### ** Examples

isStrictlyNegativeNumberVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




