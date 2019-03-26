library(checkarg)


### Name: isStrictlyPositiveNumberOrNanOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNanOrInfVectorOrNull

### ** Examples

isStrictlyPositiveNumberOrNanOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNanOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNanOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNanOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNanOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNanOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




