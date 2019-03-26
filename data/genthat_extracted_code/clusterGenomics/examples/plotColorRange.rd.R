library(clusterGenomics)


### Name: plotColorRange
### Title: Plot color scale.
### Aliases: plotColorRange

### ** Examples

## Create a dummy data set with 50 rows and 100 columns
X = matrix(rnorm(50*100), 50)

## Create a screen with 3 x 3 virtual panels and use the last two rows for the 
## heatmap
layout(matrix(c(2,3,3,1,1,1,1,1,1),3,3,byrow=TRUE))
par(mar=c(2,2,2,2))

## Plot heatmap and then the color range above the heatmap
crange = plotHeatmap(X, c(0,0))  # c(0,0) specifies no margin around heatmap
plotColorRange(crange)



