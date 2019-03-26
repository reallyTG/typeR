library(checkarg)


### Name: isBooleanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isBooleanScalar

### ** Examples

isBooleanScalar(FALSE)
   # returns TRUE (argument is valid)
isBooleanScalar("X")
   # returns FALSE (argument is invalid)
#isBooleanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanScalar(FALSE, default = TRUE)
   # returns FALSE (the argument, rather than the default, since it is not NULL)
#isBooleanScalar("X", default = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanScalar(NULL, default = TRUE)
   # returns TRUE (the default, rather than the argument, since it is NULL)




