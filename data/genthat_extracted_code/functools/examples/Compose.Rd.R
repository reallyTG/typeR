library(functools)


### Name: Compose
### Title: Compose multiple functions.
### Aliases: Compose %O%

### ** Examples

not_null <- `!` %O% is.null
not_null(4)
not_null(NULL)

add1 <- function(x) x + 1
Compose(add1,add1)(8)



