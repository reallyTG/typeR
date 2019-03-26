library(resemble)


### Name: fDiss
### Title: Euclidean, Mahalanobis and cosine dissimilarity measurements
### Aliases: fDiss

### ** Examples

require(prospectr)

data(NIRsoil)

Xu <- NIRsoil$spc[!as.logical(NIRsoil$train),]
Xr <- NIRsoil$spc[as.logical(NIRsoil$train),]

# Euclidean distances between all the samples in Xr
ed <- fDiss(Xr = Xr, method = "euclid", 
            center = TRUE, scaled = TRUE)

# Euclidean distances between samples in Xr and samples in Xu
ed.xr.xu <- fDiss(Xr = Xr, X2 = Xu, method = "euclid", 
                  center = TRUE, scaled = TRUE)

# Mahalanobis distance computed on the first 20 spectral variables
md.xr.xu <- fDiss(Xr = Xr[,1:20], X2 = Xu[,1:20], 
                 method = "mahalanobis", 
                 center = TRUE, scaled = TRUE)

# Cosine dissimilarity matrix
cdiss.xr.xu <- fDiss(Xr = Xr, X2 = Xu, 
                     method = "cosine", 
                     center = TRUE, scaled = TRUE)



