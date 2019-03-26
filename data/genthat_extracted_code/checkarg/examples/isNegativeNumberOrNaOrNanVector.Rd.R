library(checkarg)


### Name: isNegativeNumberOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNaOrNanVector

### ** Examples

isNegativeNumberOrNaOrNanVector(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNaOrNanVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNaOrNanVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




