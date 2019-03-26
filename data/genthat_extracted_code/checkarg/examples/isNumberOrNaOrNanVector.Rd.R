library(checkarg)


### Name: isNumberOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaOrNanVector

### ** Examples

isNumberOrNaOrNanVector(2)
   # returns TRUE (argument is valid)
isNumberOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




