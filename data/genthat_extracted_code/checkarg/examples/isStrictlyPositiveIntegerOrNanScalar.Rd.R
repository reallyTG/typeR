library(checkarg)


### Name: isStrictlyPositiveIntegerOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNanScalar

### ** Examples

isStrictlyPositiveIntegerOrNanScalar(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




