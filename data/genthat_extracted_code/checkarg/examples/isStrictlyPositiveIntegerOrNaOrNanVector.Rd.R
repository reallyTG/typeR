library(checkarg)


### Name: isStrictlyPositiveIntegerOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNaOrNanVector

### ** Examples

isStrictlyPositiveIntegerOrNaOrNanVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNaOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNaOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




