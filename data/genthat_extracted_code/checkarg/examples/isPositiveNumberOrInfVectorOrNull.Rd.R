library(checkarg)


### Name: isPositiveNumberOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveNumberOrInfVectorOrNull

### ** Examples

isPositiveNumberOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveNumberOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveNumberOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveNumberOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveNumberOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




