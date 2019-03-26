library(dimRed)


### Name: LLE-class
### Title: Locally Linear Embedding
### Aliases: LLE-class LLE

### ** Examples

dat <- loadDataSet("3D S Curve", n = 500)

## directy use the S4 class:
lle <- LLE()
emb <- lle@fun(dat, lle@stdpars)

## using embed():
emb2 <- embed(dat, "LLE", knn = 45)

plot(emb, type = "2vars")
plot(emb2, type = "2vars")




