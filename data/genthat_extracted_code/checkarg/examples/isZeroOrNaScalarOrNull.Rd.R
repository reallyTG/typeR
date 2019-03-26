library(checkarg)


### Name: isZeroOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNaScalarOrNull

### ** Examples

isZeroOrNaScalarOrNull(0)
   # returns TRUE (argument is valid)
isZeroOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isZeroOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaScalarOrNull(0, default = NA)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNaScalarOrNull("X", default = NA)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaScalarOrNull(NULL, default = NA)
   # returns NA (the default, rather than the argument, since it is NULL)




