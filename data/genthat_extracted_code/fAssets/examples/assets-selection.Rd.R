library(fAssets)


### Name: assets-selection
### Title: Selecting Assets from Multivariate Asset Sets
### Aliases: assetsSelect
### Keywords: models

### ** Examples

## LPP -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC
   colnames(LPP)
    
## assetsSelect -
   # Hierarchical Clustering:
   hclust <- assetsSelect(LPP, "hclust") 
   plot(hclust)
   
## assetsSelect -  
   # kmeans Clustering:
   assetsSelect(LPP, "kmeans", control = 
     c(centers = 3, algorithm = "Hartigan-Wong"))



