library(lenses)


### Name: dimnames_l
### Title: Dimnames lens
### Aliases: dimnames_l
### Keywords: datasets

### ** Examples

x <- matrix(1:4, ncol = 2)
colnames(x) <- c("first", "second")
x

view(x, dimnames_l)
set(x, dimnames_l, list(NULL, c("premiere", "deuxieme")))



