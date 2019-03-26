library(checkarg)


### Name: isStrictlyPositiveNumberOrNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaScalar

### ** Examples

isStrictlyPositiveNumberOrNaScalar(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




