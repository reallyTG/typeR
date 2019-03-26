library(listarrays)


### Name: extract_dim
### Title: Extract with '[' on a specified dimension
### Aliases: extract_dim extract_rows extract_cols

### ** Examples

# extract_rows is useful to keep the same code path for arrays of various sizes
X <- array(1:8, c(4, 3, 2))
y <- c("a", "b", "c", "d")
(Y <- onehot(y))

extract_rows(X, 2)
extract_rows(Y, 2)
extract_rows(y, 2)

library(zeallot)
c(X2, Y2, y2) %<-% extract_rows(list(X, Y, y), 2)
X2
Y2
y2



