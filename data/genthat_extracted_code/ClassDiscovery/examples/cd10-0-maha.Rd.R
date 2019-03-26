library(ClassDiscovery)


### Name: mahalanobisQC
### Title: Using Mahalanobis Distance and PCA for Quality Control
### Aliases: mahalanobisQC
### Keywords: models multivariate

### ** Examples

library(oompaData)
data(lungData)
spca <- SamplePCA(na.omit(lung.dataset))
mc <- mahalanobisQC(spca, 2)
mc[mc$p.value < 0.01,]



