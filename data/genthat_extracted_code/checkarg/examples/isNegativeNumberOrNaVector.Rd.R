library(checkarg)


### Name: isNegativeNumberOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaVector

### ** Examples

isNegativeNumberOrNaVector(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaVector("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




