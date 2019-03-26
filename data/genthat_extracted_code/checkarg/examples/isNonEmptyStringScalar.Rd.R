library(checkarg)


### Name: isNonEmptyStringScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonEmptyStringScalar

### ** Examples

isNonEmptyStringScalar("X")
   # returns TRUE (argument is valid)
isNonEmptyStringScalar(1)
   # returns FALSE (argument is invalid)
#isNonEmptyStringScalar(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonEmptyStringScalar("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNonEmptyStringScalar(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNonEmptyStringScalar(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




