library(dimRed)


### Name: PCA-class
### Title: Principal Component Analysis
### Aliases: PCA-class PCA

### ** Examples

dat <- loadDataSet("Iris")

## using the S4 Class
pca <- PCA()
emb <- pca@fun(dat, pca@stdpars)

## using embed()
emb2 <- embed(dat, "PCA")

plot(emb, type = "2vars")
plot(emb@inverse(emb@data), type = "3vars")




