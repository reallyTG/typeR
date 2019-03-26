library(dimRed)


### Name: getRotationMatrix
### Title: getRotationMatrix
### Aliases: getRotationMatrix

### ** Examples

dat <- loadDataSet("Iris")

pca <- embed(dat, "PCA")
ica <- embed(dat, "FastICA")

rot_pca <- getRotationMatrix(pca)
rot_ica <- getRotationMatrix(ica)

scale(getData(dat), TRUE, FALSE) %*% rot_pca - getData(getDimRedData(pca))
scale(getData(dat), TRUE, FALSE) %*% rot_ica - getData(getDimRedData(ica))




