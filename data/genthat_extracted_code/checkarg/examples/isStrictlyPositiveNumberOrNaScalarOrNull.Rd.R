library(checkarg)


### Name: isStrictlyPositiveNumberOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaScalarOrNull

### ** Examples

isStrictlyPositiveNumberOrNaScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




