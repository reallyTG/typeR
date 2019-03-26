library(dendroextras)


### Name: labels<-
### Title: Set the labels of an object
### Aliases: labels<- labels<-.dendrogram

### ** Examples

hc <- hclust(dist(USArrests), "ave")
dend <- as.dendrogram(hc)
labels(dend)<-abbreviate(labels(dend),minlength=2)



