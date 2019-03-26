library(checkarg)


### Name: isPositiveNumberOrNaOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNaOrNanOrInfVectorOrNull

### ** Examples

isPositiveNumberOrNaOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNaOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNaOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNaOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNaOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




