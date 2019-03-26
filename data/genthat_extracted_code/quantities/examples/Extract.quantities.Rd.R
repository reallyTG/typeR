library(quantities)


### Name: Extract.quantities
### Title: Extract or Replace Parts of an Object
### Aliases: Extract.quantities [.quantities [[.quantities [<-.quantities
###   [[<-.quantities

### ** Examples

x <- set_quantities(1:3, m/s, 0.1)
y <- set_quantities(4:6, m/s, 0.2)
(z <- rbind(x, y))
z[2, 2]
z[2, 2] <- -1
errors(z[[1, 2]]) <- 0.8
z[, 2]




