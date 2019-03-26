library(kangar00)


### Name: make_psd,matrix-method
### Title: Adjust network 'matrix' to be positive semi-definite
### Aliases: make_psd,matrix-method make_psd matrix

### ** Examples

set.seed(2345)
m <- matrix(data=sample(size=25, c(0,0,1), replace=TRUE),5,5)
m <- m + t(m)
min(eigen(m, only.values = TRUE, symmetric = TRUE)$values)
round(make_psd(m),2)




