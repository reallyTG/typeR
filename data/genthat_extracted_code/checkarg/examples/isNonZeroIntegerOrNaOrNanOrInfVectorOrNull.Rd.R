library(checkarg)


### Name: isNonZeroIntegerOrNaOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonZeroIntegerOrNaOrNanOrInfVectorOrNull

### ** Examples

isNonZeroIntegerOrNaOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isNonZeroIntegerOrNaOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNonZeroIntegerOrNaOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNonZeroIntegerOrNaOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNonZeroIntegerOrNaOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




