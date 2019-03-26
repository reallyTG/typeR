library(checkarg)


### Name: isNaOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrNanScalarOrNull

### ** Examples

isNaOrNanScalarOrNull(NA)
   # returns TRUE (argument is valid)
isNaOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isNaOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrNanScalarOrNull(NA, default = NaN)
   # returns NA (the argument, rather than the default, since it is not NULL)
#isNaOrNanScalarOrNull("X", default = NaN)
   # throws exception with message defined by message and argumentName parameters
isNaOrNanScalarOrNull(NULL, default = NaN)
   # returns NaN (the default, rather than the argument, since it is NULL)




