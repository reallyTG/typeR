library(checkarg)


### Name: isPositiveNumberOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaOrNanVector

### ** Examples

isPositiveNumberOrNaOrNanVector(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




