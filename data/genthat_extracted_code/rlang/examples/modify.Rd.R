library(rlang)


### Name: modify
### Title: Modify a vector
### Aliases: modify
### Keywords: internal

### ** Examples

modify(c(1, b = 2, 3), 4, b = "foo")

x <- list(a = 1, b = 2)
y <- list(b = 3, c = 4)
modify(x, splice(y))



