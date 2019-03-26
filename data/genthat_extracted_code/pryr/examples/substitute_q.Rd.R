library(pryr)


### Name: substitute_q
### Title: A version of substitute that evaluates its first argument.
### Aliases: substitute_q

### ** Examples

x <- quote(a + b)
substitute(x, list(a = 1, b = 2))
substitute_q(x, list(a = 1, b = 2))



