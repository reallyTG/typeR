library(dimRed)


### Name: Isomap-class
### Title: Isomap embedding
### Aliases: Isomap-class Isomap

### ** Examples

dat <- loadDataSet("3D S Curve", n = 500)

## use the S4 Class directly:
isomap <- Isomap()
emb <- isomap@fun(dat, isomap@stdpars)

## or simpler, use embed():
samp <- sample(nrow(dat), size = 200)
emb2 <- embed(dat[samp], "Isomap", mute = NULL, knn = 10)
emb3 <- emb2@apply(dat[-samp])

plot(emb2, type = "2vars")
plot(emb3, type = "2vars")




