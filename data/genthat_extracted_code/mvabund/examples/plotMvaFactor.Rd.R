library(mvabund)


### Name: plotMvaFactor
### Title: Draw a Mvabund Object split into groups.
### Aliases: plotMvaFactor
### Keywords: hplot

### ** Examples

require(graphics)

## Plot an Environment Factor vs Abundance plot
data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x

## Create a Environmental factor where TRUE=Sand, FALSE=No Sand)
X <- as.factor(X[,2]>0)
plotMvaFactor(x=spiddat, y=X)



