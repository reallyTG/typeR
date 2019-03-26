library(lenses)


### Name: formals_l
### Title: Formals lens
### Aliases: formals_l
### Keywords: datasets

### ** Examples

f <- function(x) x + y + 7
view(f, formals_l)

g <- set(f, formals_l, list(x = 1, y = 2))
g()



