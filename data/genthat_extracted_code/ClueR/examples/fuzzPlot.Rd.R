library(ClueR)


### Name: fuzzPlot
### Title: Visualize fuzzy clustering results
### Aliases: fuzzPlot

### ** Examples

# load the human ES phosphoprotoemics data (Rigbolt et al. Sci Signal. 4(164):rs3, 2011)
data(hES)
# apply cmeans clustering to partition the data into 11 clusters
clustObj <- cmeans(hES, centers=11, iter.max=50, m=1.25)
# visualize clustering reuslts
fuzzPlot(hES, clustObj, mfrow = c(3,4))




