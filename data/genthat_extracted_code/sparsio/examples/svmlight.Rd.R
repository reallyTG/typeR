library(sparsio)


### Name: svmlight
### Title: Fast svmlight reader and writer
### Aliases: svmlight read_svmlight write_svmlight

### ** Examples

library(Matrix)
library(sparsio)
i = 1:8
j = 1:8
v = rep(2, 8)
x = sparseMatrix(i, j, x = v)
y = sample(c(0, 1), nrow(x), replace = TRUE)
f = tempfile(fileext = ".svmlight")
write_svmlight(x, y, f)
x2 = read_svmlight(f, type = "CsparseMatrix")
identical(x2$x, x)
identical(x2$y, y)



