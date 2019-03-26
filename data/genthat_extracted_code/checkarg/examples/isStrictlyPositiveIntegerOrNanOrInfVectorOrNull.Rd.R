library(checkarg)


### Name: isStrictlyPositiveIntegerOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNanOrInfVectorOrNull

### ** Examples

isStrictlyPositiveIntegerOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




