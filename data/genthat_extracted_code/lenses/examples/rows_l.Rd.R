library(lenses)


### Name: rows_l
### Title: Row lens
### Aliases: rows_l

### ** Examples

x <- matrix(1:4, ncol = 2)
rownames(x) <- c("first", "second")
x

view(x, rows_l(1))
view(x, rows_l("second"))
set(x, rows_l(1), c(20,40))



