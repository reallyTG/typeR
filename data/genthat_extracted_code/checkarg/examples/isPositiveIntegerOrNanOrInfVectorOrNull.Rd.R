library(checkarg)


### Name: isPositiveIntegerOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNanOrInfVectorOrNull

### ** Examples

isPositiveIntegerOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




