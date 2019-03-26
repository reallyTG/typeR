library(checkarg)


### Name: isNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrNanVector

### ** Examples

isNaOrNanVector(NA)
   # returns TRUE (argument is valid)
isNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrNanVector(NA, default = NaN)
   # returns NA (the argument, rather than the default, since it is not NULL)
#isNaOrNanVector("X", default = NaN)
   # throws exception with message defined by message and argumentName parameters
isNaOrNanVector(NULL, default = NaN)
   # returns NaN (the default, rather than the argument, since it is NULL)




