library(lenses)


### Name: cols_l
### Title: Column lens
### Aliases: cols_l

### ** Examples

x <- matrix(1:4, ncol = 2)
colnames(x) <- c("first", "second")
x

view(x, cols_l(1))
view(x, cols_l("second"))
set(x, cols_l(1), c(20,40))



