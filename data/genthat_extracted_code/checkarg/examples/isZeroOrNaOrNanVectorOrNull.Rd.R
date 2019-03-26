library(checkarg)


### Name: isZeroOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNaOrNanVectorOrNull

### ** Examples

isZeroOrNaOrNanVectorOrNull(0)
   # returns TRUE (argument is valid)
isZeroOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isZeroOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaOrNanVectorOrNull(0, default = NA)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNaOrNanVectorOrNull("X", default = NA)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaOrNanVectorOrNull(NULL, default = NA)
   # returns NA (the default, rather than the argument, since it is NULL)




