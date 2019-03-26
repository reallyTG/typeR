library(checkarg)


### Name: isStrictlyPositiveIntegerScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerScalarOrNull

### ** Examples

isStrictlyPositiveIntegerScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




