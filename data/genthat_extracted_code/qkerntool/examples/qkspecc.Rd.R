library(qkerntool)


### Name: qkspecc
### Title: qkernel spectral Clustering
### Aliases: qkspecc qkspecc,matrix-method qkspecc,qkernmatrix-method
###   qkspecc,cndkernmatrix-method show,qkspecc-method
### Keywords: cluster

### ** Examples

data("iris")
x=as.matrix(iris[,-5])

qspe <- qkspecc(x,kernel = "rbfbase", qpar = list(sigma = 10, q = 0.9),
                Nocent=3, normalize="symmetric", maxk=15, iterations=1200)
plot(x, col = clust(qspe))

qkfunc <- nonlbase(alpha=1/15,q=0.8)
Ktrain <- qkernmatrix(qkfunc, x)
qspe <- qkspecc(Ktrain, Nocent=3, normalize="symmetric", maxk=20)
plot(x, col = clust(qspe))



