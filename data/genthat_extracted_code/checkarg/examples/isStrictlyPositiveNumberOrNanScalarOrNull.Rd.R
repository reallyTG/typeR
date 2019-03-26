library(checkarg)


### Name: isStrictlyPositiveNumberOrNanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNanScalarOrNull

### ** Examples

isStrictlyPositiveNumberOrNanScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNanScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNanScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNanScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




