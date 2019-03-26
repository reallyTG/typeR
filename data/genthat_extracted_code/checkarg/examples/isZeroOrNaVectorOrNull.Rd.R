library(checkarg)


### Name: isZeroOrNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNaVectorOrNull

### ** Examples

isZeroOrNaVectorOrNull(0)
   # returns TRUE (argument is valid)
isZeroOrNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isZeroOrNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaVectorOrNull(0, default = NA)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNaVectorOrNull("X", default = NA)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaVectorOrNull(NULL, default = NA)
   # returns NA (the default, rather than the argument, since it is NULL)




