library(checkarg)


### Name: checkarg
### Title: Perform a basic check on the type of an argument and its
###   value(s) and set a default value if applicable.
### Aliases: checkarg

### ** Examples

checkarg(TRUE, "BOOLEAN")
  # returns TRUE (argument is valid)
checkarg(FALSE, "BOOLEAN")
  # returns TRUE (argument is valid)
checkarg(1, "BOOLEAN")
  # returns FALSE (argument is invalid)
checkarg("Y", "BOOLEAN")
  # returns FALSE (argument is invalid)
#checkarg("Y", "BOOLEAN", stopIfNot = TRUE)
  # throws exception with message defined by message and argumentName parameters

checkarg(1, "NUMBER", default = 0)
  # returns 1 (argument is returned if provided, i.e. not NULL, and valid)
checkarg(NULL, "NUMBER", default = 0)
  # returns 0 (default is returned since argument is not provided)
checkarg(NULL, "NUMBER", default = 0)
  # returns 0 (default is returned since argument is not provided)
checkarg(NA, "NUMBER")
  # returns FALSE (NA values are not allowed by default)
checkarg(NA, "NUMBER", naAllowed = TRUE)
  # returns TRUE (NA values are allowed)
checkarg(c(0, 1), "NUMBER")
  # returns FALSE (scalar value expected by default)
checkarg(c(0, 1), "NUMBER", n = NA)
  # returns TRUE (any length vector allowed)

checkarg("X", "STRING")
  # returns TRUE (argument is valid)
checkarg(TRUE, "STRING")
  # returns FALSE (argument is invalid)
checkarg(1, "STRING")
  # returns FALSE (argument is invalid)




