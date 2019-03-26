library(ade4)


### Name: dist.binary
### Title: Computation of Distance Matrices for Binary Data
### Aliases: dist.binary
### Keywords: array multivariate

### ** Examples

data(aviurba)
for (i in 1:10) {
    d <- dist.binary(aviurba$fau, method = i)
    cat(attr(d, "method"), is.euclid(d), "\n")}



