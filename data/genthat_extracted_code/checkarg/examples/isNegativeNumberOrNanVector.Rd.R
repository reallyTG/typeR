library(checkarg)


### Name: isNegativeNumberOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNegativeNumberOrNanVector

### ** Examples

isNegativeNumberOrNanVector(-2)
   # returns TRUE (argument is valid)
isNegativeNumberOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNegativeNumberOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanVector(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isNegativeNumberOrNanVector("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isNegativeNumberOrNanVector(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




