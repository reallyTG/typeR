library(checkarg)


### Name: isZeroOrNaOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isZeroOrNaOrNanScalarOrNull

### ** Examples

isZeroOrNaOrNanScalarOrNull(0)
   # returns TRUE (argument is valid)
isZeroOrNaOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isZeroOrNaOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaOrNanScalarOrNull(0, default = NA)
   # returns 0 (the argument, rather than the default, since it is not NULL)
#isZeroOrNaOrNanScalarOrNull("X", default = NA)
   # throws exception with message defined by message and argumentName parameters
isZeroOrNaOrNanScalarOrNull(NULL, default = NA)
   # returns NA (the default, rather than the argument, since it is NULL)




