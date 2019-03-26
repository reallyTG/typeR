library(checkarg)


### Name: isStrictlyPositiveNumberOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaOrNanVectorOrNull

### ** Examples

isStrictlyPositiveNumberOrNaOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




