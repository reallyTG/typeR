library(checkarg)


### Name: isStrictlyPositiveIntegerOrNaOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNaOrInfVectorOrNull

### ** Examples

isStrictlyPositiveIntegerOrNaOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNaOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNaOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNaOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




