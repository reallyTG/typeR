library(errors)


### Name: Extract.errors
### Title: Extract or Replace Parts of an Object
### Aliases: Extract.errors [.errors [[.errors [<-.errors [[<-.errors

### ** Examples

x <- set_errors(1:3, 0.1)
y <- set_errors(4:6, 0.2)
(z <- rbind(x, y))
z[2, 2]
z[2, 2] <- -1
errors(z[[1, 2]]) <- 0.8
z[, 2]




