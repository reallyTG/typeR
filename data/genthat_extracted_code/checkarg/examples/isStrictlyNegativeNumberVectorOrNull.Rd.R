library(checkarg)


### Name: isStrictlyNegativeNumberVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeNumberVectorOrNull

### ** Examples

isStrictlyNegativeNumberVectorOrNull(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeNumberVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeNumberVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberVectorOrNull(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeNumberVectorOrNull("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeNumberVectorOrNull(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




