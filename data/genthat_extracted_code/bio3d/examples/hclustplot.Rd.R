library(bio3d)


### Name: hclustplot
### Title: Dendrogram with Clustering Annotation
### Aliases: hclustplot
### Keywords: hplot

### ** Examples

## No test: 
# Redundant testing excluded

attach(transducin)

##- perform RMSD clustering
rd <- rmsd(pdbs, fit=TRUE)
hc <- hclust(as.dist(rd))

##- draw dendrogram 
hclustplot(hc, k=3)

##- draw dendrogram with manual clustering annotation
#hclustplot(hc, colors=annotation[, "color"], labels=pdbs$id)

detach(transducin)

## End(No test)



