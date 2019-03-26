library(checkarg)


### Name: isStringScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStringScalar

### ** Examples

isStringScalar("X")
   # returns TRUE (argument is valid)
isStringScalar(1)
   # returns FALSE (argument is invalid)
#isStringScalar(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStringScalar("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isStringScalar(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isStringScalar(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




