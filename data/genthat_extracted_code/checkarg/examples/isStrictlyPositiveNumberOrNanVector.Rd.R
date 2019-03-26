library(checkarg)


### Name: isStrictlyPositiveNumberOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNanVector

### ** Examples

isStrictlyPositiveNumberOrNanVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNanVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




