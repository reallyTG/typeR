library(checkarg)


### Name: isZeroOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNaOrNanVector

### ** Examples

isZeroOrNaOrNanVector(0)
   # returns TRUE (argument is valid)
isZeroOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isZeroOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaOrNanVector(0, default = NA)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNaOrNanVector("X", default = NA)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaOrNanVector(NULL, default = NA)
   # returns NA (the default, rather than the argument, since it is NULL)




