library(seriation)


### Name: hmap
### Title: Plot Heat Map Reordered Using Seriation
### Aliases: hmap
### Keywords: hplot

### ** Examples

data("Wood")

## default heatmap does Euclidean distance, hierarchical clustering with
## average-link and optimal leaf ordering
hmap(Wood)  
  
## heatmap with correlation-based distance, green-red color (greenred is 
## predefined) and optimal leaf ordering and no row label
dist_cor <- function(x) as.dist(1-cor(t(x)))
  
hmap(Wood, method="OLO", distfun = dist_cor, col=greenred(100), labRow=FALSE)
  
## order-based heatmap
hmap(Wood, method="MDS_angle", distfun = dist_cor, col=greenred(100))  

## order-based with dissimilarity matrices
hmap(Wood, method="MDS_angle", distfun = dist_cor, showdist = "both", 
  col=greenred(100))  



