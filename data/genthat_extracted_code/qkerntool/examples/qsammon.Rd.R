library(qkerntool)


### Name: qsammon
### Title: qKernel Sammon Mapping
### Aliases: qsammon qsammon,matrix-method qsammon,cndkernmatrix-method
###   qsammon,qkernmatrix-method
### Keywords: cluster

### ** Examples

data(iris)
train <- as.matrix(iris[,1:4])
labeltrain<- as.integer(iris[,5])
## S4 method for signature 'matrix'
kpc2 <- qsammon(train, kernel = "rbfbase", qpar = list(sigma = 2, q = 0.9), dims = 2,
                Initialisation = 'pca', TolFun = 1e-5)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)





