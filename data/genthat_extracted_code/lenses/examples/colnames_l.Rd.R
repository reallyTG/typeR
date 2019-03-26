library(lenses)


### Name: colnames_l
### Title: A lens into the column names of an object
### Aliases: colnames_l
### Keywords: datasets

### ** Examples

x <- matrix(1:4, ncol = 2)
colnames(x) <- c("first", "second")
x

view(x, colnames_l)
set(x, colnames_l, c("premiere", "deuxieme"))



