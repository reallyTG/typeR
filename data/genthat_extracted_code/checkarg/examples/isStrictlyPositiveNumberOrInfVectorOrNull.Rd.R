library(checkarg)


### Name: isStrictlyPositiveNumberOrInfVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrInfVectorOrNull

### ** Examples

isStrictlyPositiveNumberOrInfVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrInfVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrInfVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrInfVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrInfVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrInfVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




