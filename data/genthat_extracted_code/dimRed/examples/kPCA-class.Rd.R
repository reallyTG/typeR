library(dimRed)


### Name: kPCA-class
### Title: Kernel PCA
### Aliases: kPCA-class kPCA

### ** Examples

## Not run: 
##D dat <- loadDataSet("3D S Curve")
##D 
##D ## use the S4 class directly:
##D kpca <- kPCA()
##D emb <- kpca@fun(dat, kpca@stdpars)
##D 
##D ## simpler, use embed():
##D emb2 <- embed(dat, "kPCA")
##D 
##D plot(emb, type = "2vars")
## End(Not run)



