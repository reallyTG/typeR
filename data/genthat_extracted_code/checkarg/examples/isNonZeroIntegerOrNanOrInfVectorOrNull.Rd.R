library(checkarg)


### Name: isNonZeroIntegerOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNanOrInfVectorOrNull

### ** Examples

isNonZeroIntegerOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




