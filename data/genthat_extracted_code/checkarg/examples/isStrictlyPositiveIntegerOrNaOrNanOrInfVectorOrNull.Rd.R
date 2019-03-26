library(checkarg)


### Name: isStrictlyPositiveIntegerOrNaOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNaOrNanOrInfVectorOrNull

### ** Examples

isStrictlyPositiveIntegerOrNaOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNaOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNaOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNaOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




