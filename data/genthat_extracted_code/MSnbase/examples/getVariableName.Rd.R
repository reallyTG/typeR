library(MSnbase)


### Name: getVariableName
### Title: Return a variable name
### Aliases: getVariableName

### ** Examples

a <- 1
f <- function(x, y)
 MSnbase:::getVariableName(match.call(), "x")
f(x = a)
f(y = a)



