library(checkarg)


### Name: isNaOrStringScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrStringScalar

### ** Examples

isNaOrStringScalar("X")
   # returns TRUE (argument is valid)
isNaOrStringScalar(1)
   # returns FALSE (argument is invalid)
#isNaOrStringScalar(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrStringScalar("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNaOrStringScalar(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNaOrStringScalar(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




