library(bigstatsr)


### Name: big_transpose
### Title: Transposition
### Aliases: big_transpose

### ** Examples

X <- FBM(10, 5, init = rnorm(50))
X[]
Xt <- big_transpose(X)
identical(t(X[]), Xt[])

X <- big_attachExtdata()
Xt <- big_transpose(X)
identical(t(X[]), Xt[])




