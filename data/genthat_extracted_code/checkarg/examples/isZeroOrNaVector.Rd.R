library(checkarg)


### Name: isZeroOrNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNaVector

### ** Examples

isZeroOrNaVector(0)
   # returns TRUE (argument is valid)
isZeroOrNaVector("X")
   # returns FALSE (argument is invalid)
#isZeroOrNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaVector(0, default = NA)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNaVector("X", default = NA)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaVector(NULL, default = NA)
   # returns NA (the default, rather than the argument, since it is NULL)




