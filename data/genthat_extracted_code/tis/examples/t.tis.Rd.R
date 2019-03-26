library(tis)


### Name: t.tis
### Title: Matrix Transpose
### Aliases: t.tis
### Keywords: ts array

### ** Examples

a <- tis(matrix(1:30, 5,6), start = latestMonth())
a
t(a)  ##i.e.,  a[i, j] == t(a)[j, i] for all i,j, and t(a) is NOT a time series



