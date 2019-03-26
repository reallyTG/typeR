library(checkarg)


### Name: isNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrNanVectorOrNull

### ** Examples

isNaOrNanVectorOrNull(NA)
   # returns TRUE (argument is valid)
isNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrNanVectorOrNull(NA, default = NaN)
   # returns NA (the argument, rather than the default, since it is not NULL)
#isNaOrNanVectorOrNull("X", default = NaN)
   # throws exception with message defined by message and argumentName parameters
isNaOrNanVectorOrNull(NULL, default = NaN)
   # returns NaN (the default, rather than the argument, since it is NULL)




