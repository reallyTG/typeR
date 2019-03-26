library(lenses)


### Name: rownames_l
### Title: A lens into the row names of an object
### Aliases: rownames_l
### Keywords: datasets

### ** Examples

x <- matrix(1:4, ncol = 2)
rownames(x) <- c("first", "second")
x

view(x, rownames_l)
set(x, rownames_l, c("premiere", "deuxieme"))



