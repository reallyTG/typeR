library(functional)


### Name: multi.argument.Compose
### Title: Composition with multiple arguments.
### Aliases: multi.argument.Compose

### ** Examples

f <- function(x, y) x+y
g <- function(x) x*2
stopifnot(multi.argument.Compose(f, g)(1,1) == 4)



