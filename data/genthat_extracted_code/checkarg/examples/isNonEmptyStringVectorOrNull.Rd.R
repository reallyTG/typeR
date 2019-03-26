library(checkarg)


### Name: isNonEmptyStringVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNonEmptyStringVectorOrNull

### ** Examples

isNonEmptyStringVectorOrNull("X")
   # returns TRUE (argument is valid)
isNonEmptyStringVectorOrNull(1)
   # returns FALSE (argument is invalid)
#isNonEmptyStringVectorOrNull(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNonEmptyStringVectorOrNull("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNonEmptyStringVectorOrNull(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNonEmptyStringVectorOrNull(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




