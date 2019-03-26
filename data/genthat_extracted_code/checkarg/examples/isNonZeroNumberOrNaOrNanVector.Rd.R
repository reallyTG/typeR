library(checkarg)


### Name: isNonZeroNumberOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroNumberOrNaOrNanVector

### ** Examples

isNonZeroNumberOrNaOrNanVector(2)
   # returns TRUE (argument is valid)
isNonZeroNumberOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNonZeroNumberOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroNumberOrNaOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroNumberOrNaOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




