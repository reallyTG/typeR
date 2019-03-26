library(checkarg)


### Name: isStrictlyPositiveIntegerOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNanVector

### ** Examples

isStrictlyPositiveIntegerOrNanVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNanVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




