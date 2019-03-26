library(checkarg)


### Name: isNonZeroNumberOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNanVector

### ** Examples

isNonZeroNumberOrNanVector(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




