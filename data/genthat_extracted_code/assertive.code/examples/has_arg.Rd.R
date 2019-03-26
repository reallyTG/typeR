library(assertive.code)


### Name: assert_has_arg
### Title: Does the current call have an argument?
### Aliases: assert_has_arg has_arg has_arg_

### ** Examples

has_arg(x, mean.default)
has_arg(y, mean.default)   
f <- function(...) has_arg(z)   
f(z = 123)
f(123)



