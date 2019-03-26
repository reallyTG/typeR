library(checkarg)


### Name: isPositiveIntegerOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNanScalar

### ** Examples

isPositiveIntegerOrNanScalar(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




