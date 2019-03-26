library(clusterGenomics)


### Name: plotColorbarCol
### Title: Add a colorbar above a heatmap.
### Aliases: plotColorbarCol

### ** Examples

## Create a dummy data set with 50 rows and 100 columns
X = matrix(rnorm(50*100), 50)
colgroups = sample(1:3, 100, replace=TRUE)

## Plot a heatmap and then add a color bar on the left side
margin = c(0.1, 0)
plotHeatmap(X, margin)
plotColorbarCol(colgroups, margin)



