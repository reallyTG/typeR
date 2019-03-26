library(dimRed)


### Name: nMDS-class
### Title: Non-Metric Dimensional Scaling
### Aliases: nMDS-class nMDS

### ** Examples

dat <- loadDataSet("3D S Curve", n = 1000)

## using the S4 classes:
nmds <- nMDS()
emb <- nmds@fun(dat, nmds@stdpars)


## using embed()
emb2 <- embed(dat, "nMDS", d = function(x) exp(dist(x)))


plot(emb, type = "2vars")
plot(emb2, type = "2vars")




