library(checkarg)


### Name: isStrictlyPositiveIntegerVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerVectorOrNull

### ** Examples

isStrictlyPositiveIntegerVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




