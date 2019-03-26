library(checkarg)


### Name: isStrictlyNegativeNumberOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaVector

### ** Examples

isStrictlyNegativeNumberOrNaVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




