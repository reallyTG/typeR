library(checkarg)


### Name: isPositiveNumberOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrNanOrInfVectorOrNull

### ** Examples

isPositiveNumberOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




