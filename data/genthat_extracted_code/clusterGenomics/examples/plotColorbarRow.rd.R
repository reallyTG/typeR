library(clusterGenomics)


### Name: plotColorbarRow
### Title: Add a colorbar on the left side of a heatmap.
### Aliases: plotColorbarRow

### ** Examples

## Create a dummy data set with 50 rows and 100 columns
X = matrix(rnorm(50*100), 50)
rowgroups = sample(1:3, 50, replace=TRUE)

## Plot a heatmap and then add a color bar on the left side
margin = c(0.1, 0)
plotHeatmap(X, margin)
plotColorbarRow(rowgroups, margin)



