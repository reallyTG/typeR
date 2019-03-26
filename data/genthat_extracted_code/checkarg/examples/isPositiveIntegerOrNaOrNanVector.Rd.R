library(checkarg)


### Name: isPositiveIntegerOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNaOrNanVector

### ** Examples

isPositiveIntegerOrNaOrNanVector(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNaOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




