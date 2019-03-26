library(checkarg)


### Name: isStrictlyPositiveNumberOrNaOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaOrNanVector

### ** Examples

isStrictlyPositiveNumberOrNaOrNanVector(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaOrNanVector("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




