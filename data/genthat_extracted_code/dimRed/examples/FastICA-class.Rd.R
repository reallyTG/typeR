library(dimRed)


### Name: FastICA-class
### Title: Independent Component Analysis
### Aliases: FastICA-class FastICA

### ** Examples

dat <- loadDataSet("3D S Curve")

## use the S4 Class directly:
fastica <- FastICA()
emb <- fastica@fun(dat, pars = list(ndim = 2))

## simpler, use embed():
emb2 <- embed(dat, "FastICA", ndim = 2)


plot(emb@data@data)




