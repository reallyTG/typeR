library(intrinsicDimension)


### Name: pcaLocalDimEst
### Title: Local Dimension Estimation with PCA
### Aliases: pcaLocalDimEst

### ** Examples

data <- cutHyperPlane(100, 4, 10, .05)
pcaLocalDimEst(data, 'fan')
pcaLocalDimEst(data, 'FO')
pcaLocalDimEst(data, 'maxgap')




