library(checkarg)


### Name: isNumberOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrInfVectorOrNull

### ** Examples

isNumberOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isNumberOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




