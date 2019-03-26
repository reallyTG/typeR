library(checkarg)


### Name: isStrictlyPositiveNumberOrNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaVectorOrNull

### ** Examples

isStrictlyPositiveNumberOrNaVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




