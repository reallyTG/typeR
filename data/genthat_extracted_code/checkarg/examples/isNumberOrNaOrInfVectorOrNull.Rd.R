library(checkarg)


### Name: isNumberOrNaOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaOrInfVectorOrNull

### ** Examples

isNumberOrNaOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isNumberOrNaOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




