library(checkarg)


### Name: isIntegerOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNanOrInfVectorOrNull

### ** Examples

isIntegerOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isIntegerOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




