library(RevEcoR)


### Name: compose
### Title: Compose multiple functions
### Aliases: %.% compose

### ** Examples

not_null <- `!` %.% is.null
not_null(4)
not_null(NULL)

add1 <- function(x) x + 1
compose(add1,add1)(8)



