library(checkarg)


### Name: isIntegerOrNaOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrNanOrInfVectorOrNull

### ** Examples

isIntegerOrNaOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




