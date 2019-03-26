library(checkarg)


### Name: isIntegerOrNaOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrInfVectorOrNull

### ** Examples

isIntegerOrNaOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




