library(checkarg)


### Name: isStrictlyNegativeNumberOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberOrNaOrNanVector

### ** Examples

isStrictlyNegativeNumberOrNaOrNanVector(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberOrNaOrNanVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberOrNaOrNanVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




