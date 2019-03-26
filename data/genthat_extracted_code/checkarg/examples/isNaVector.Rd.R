library(checkarg)


### Name: isNaVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaVector

### ** Examples

isNaVector(NA)
   # returns TRUE (argument is valid)
isNaVector("X")
   # returns FALSE (argument is invalid)
#isNaVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters




