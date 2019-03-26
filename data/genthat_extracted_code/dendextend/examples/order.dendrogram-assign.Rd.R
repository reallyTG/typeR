library(dendextend)


### Name: order.dendrogram<-
### Title: order.dendrogram<- assignment operator
### Aliases: order.dendrogram<-

### ** Examples

################
# Example for using the assignment with dendrogram and hclust objects:
hc <- hclust(dist(USArrests[1:4,]), "ave")
dend <- as.dendrogram(hc)

str(dend)
order.dendrogram(dend) # 4 3 1 2
order.dendrogram(dend) <- 1:4
order.dendrogram(dend) # 1 2 3 4
str(dend) # the structure is still fine.

# This function is very useful if we try playing with subtrees
# For example:
hc <- hclust(dist(USArrests[1:6,]), "ave")
dend <- as.dendrogram(hc)
sub_dend <- dend[[1]]
order.dendrogram(sub_dend) # 4 6
# now using as.hclust(sub_dend) will cause trouble: 
# labels(as.hclust(sub_dend)) # As of R 3.1.1-patched - this will produce an Error (as it should) :)
# let's fix it:

order.dendrogram(sub_dend) <- rank(order.dendrogram(sub_dend), ties.method= "first")
labels(as.hclust(sub_dend)) # We now have labels :)




