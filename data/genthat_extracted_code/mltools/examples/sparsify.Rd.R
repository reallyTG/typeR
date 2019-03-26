library(mltools)


### Name: sparsify
### Title: Sparsify
### Aliases: sparsify

### ** Examples

library(data.table)
library(Matrix)

dt <- data.table(
  intCol=c(1L, NA_integer_, 3L, 0L),
  realCol=c(NA, 2, NA, NA),
  logCol=c(TRUE, FALSE, TRUE, FALSE),
  ofCol=factor(c("a", "b", NA, "b"), levels=c("a", "b", "c"), ordered=TRUE),
  ufCol=factor(c("a", NA, "c", "b"), ordered=FALSE)
)

sparsify(dt)
sparsify(dt, sparsifyNAs=TRUE)
sparsify(dt[, list(realCol)], naCols="identify")
sparsify(dt[, list(realCol)], naCols="efficient")



