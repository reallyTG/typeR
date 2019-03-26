library(checkarg)


### Name: isNegativeNumberVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberVector

### ** Examples

isNegativeNumberVector(-2)
   # returns TRUE (argument is valid)
isNegativeNumberVector("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




