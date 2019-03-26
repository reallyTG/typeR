library(checkarg)


### Name: isNonEmptyStringScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonEmptyStringScalarOrNull

### ** Examples

isNonEmptyStringScalarOrNull("X")
   # returns TRUE (argument is valid)
isNonEmptyStringScalarOrNull(1)
   # returns FALSE (argument is invalid)
#isNonEmptyStringScalarOrNull(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonEmptyStringScalarOrNull("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNonEmptyStringScalarOrNull(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNonEmptyStringScalarOrNull(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




