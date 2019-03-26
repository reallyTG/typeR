library(fAssets)


### Name: plot-similarity
### Title: Assets Similarity Plots
### Aliases: similarityPlot assetsDendrogramPlot assetsCorEigenPlot
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC
   head(LPP) 

## assetsDendrogramPlot - 
   # Display a Dendrogram Plot:
   assetsDendrogramPlot(LPP)
   
## assetsCorEigenPlot -
   # Display a Correlation Eigenvalue Ratio  Plot:
   assetsCorEigenPlot(LPP)



