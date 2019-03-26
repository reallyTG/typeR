library(checkarg)


### Name: isStrictlyPositiveIntegerOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNaScalarOrNull

### ** Examples

isStrictlyPositiveIntegerOrNaScalarOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaScalarOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNaScalarOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaScalarOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




