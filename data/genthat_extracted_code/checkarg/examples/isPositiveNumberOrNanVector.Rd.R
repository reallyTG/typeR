library(checkarg)


### Name: isPositiveNumberOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNanVector

### ** Examples

isPositiveNumberOrNanVector(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNanVector("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




