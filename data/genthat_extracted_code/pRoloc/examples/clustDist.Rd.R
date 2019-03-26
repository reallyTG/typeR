library(pRoloc)


### Name: clustDist
### Title: Pairwise Distance Computation for Protein Information Sets
### Aliases: clustDist

### ** Examples

library(pRolocdata)
data(dunkley2006)
par <- setAnnotationParams(inputs =
                   c("Arabidopsis thaliana genes",
                   "Gene stable ID"))
## add protein sets/annotation information
xx <- addGoAnnotations(dunkley2006, par)
## filter
xx <- filterMinMarkers(xx, n = 50)
xx <- filterMaxMarkers(xx, p = .25)
## get distances for protein sets 
dd <- clustDist(xx)
## plot clusters for first 'ClustDist' object 
## in the 'ClustDistList'
plot(dd[[1]], xx)
## plot distances for all protein sets 
plot(dd)
## Extract normalised distances
## Normalise by n^1/3
minDist <- getNormDist(dd, p = 1/3)
## Get new order according to lowest distance
o <- order(minDist)
## Re-order GOAnnotations 
fData(xx)$GOAnnotations <- fData(xx)$GOAnnotations[, o]
if (interactive()) {
pRolocVis(xx, fcol = "GOAnnotations")
}



