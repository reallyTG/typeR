library(checkarg)


### Name: isPositiveIntegerOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNanVector

### ** Examples

isPositiveIntegerOrNanVector(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNanVector("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




