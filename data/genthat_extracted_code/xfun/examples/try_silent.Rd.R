library(xfun)


### Name: try_silent
### Title: Try to evaluate an expression silently
### Aliases: try_silent

### ** Examples

library(xfun)
z = try_silent(stop("Wrong!"))
inherits(z, "try-error")



