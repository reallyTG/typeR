library(fAssets)


### Name: assets-arrange
### Title: Rearranging Assets Columnwise
### Aliases: assetsArrange pcaArrange hclustArrange abcArrange orderArrange
###   sampleArrange statsArrange
### Keywords: models

### ** Examples
  
## LPP -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC[, 1:3]
   head(LPP)
    
## assetsArrange -
   # Arrange Assets Columns:
   assetsArrange(x=LPP, "pca")
   assetsArrange(x=LPP, "hclust")
   assetsArrange(x=LPP, "abc")
   
## Alternative Usage -
   pcaArrange(x=LPP, robust=FALSE)
   pcaArrange(x=LPP, robust=TRUE)
   hclustArrange(x=LPP, method = c("euclidean", "complete"))
   abcArrange(x=LPP)
   orderArrange(x=LPP)
   sampleArrange(x=LPP)
   statsArrange(x=LPP, FUN=colMeans)



