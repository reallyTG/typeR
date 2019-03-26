library(qkerntool)


### Name: qkspeclust
### Title: qkernel spectral Clustering
### Aliases: qkspeclust qkspeclust,qkspecc-method
### Keywords: cluster

### ** Examples

data("iris")
x=as.matrix(iris[ ,-5])

qspe <- qkspecc(x,kernel = "rbfbase", qpar = list(sigma = 90, q = 0.9),
                Nocent=3, normalize="symmetric", maxk=15,iterations=1200)
plot(x, col = clust(qspe))

qspec <- qkspeclust(qspe,clustmethod = "hclust", Nocent=3, hmethod="ward.D2")
plot(x, col = clust(qspec))
plot(qspec)




