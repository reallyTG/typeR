library(checkarg)


### Name: isBooleanScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isBooleanScalarOrNull

### ** Examples

isBooleanScalarOrNull(FALSE)
   # returns TRUE (argument is valid)
isBooleanScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isBooleanScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanScalarOrNull(FALSE, default = TRUE)
   # returns FALSE (the argument, rather than the default, since it is not NULL)
#isBooleanScalarOrNull("X", default = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanScalarOrNull(NULL, default = TRUE)
   # returns TRUE (the default, rather than the argument, since it is NULL)




