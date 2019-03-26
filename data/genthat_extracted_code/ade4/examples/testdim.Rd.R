library(ade4)


### Name: testdim
### Title: Function to perform a test of dimensionality
### Aliases: testdim testdim.pca
### Keywords: multivariate

### ** Examples

tab <- data.frame(matrix(rnorm(200),20,10))
pca1 <- dudi.pca(tab,scannf=FALSE)
test1 <- testdim(pca1)
test1
test1$nb
test1$nb.cor
data(doubs)
pca2 <- dudi.pca(doubs$env,scannf=FALSE)
test2 <- testdim(pca2)
test2
test2$nb
test2$nb.cor



