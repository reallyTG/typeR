library(agricolae)


### Name: hgroups
### Title: groups of hclust
### Aliases: hgroups
### Keywords: cluster

### ** Examples

library(agricolae)
data(pamCIP)
# only code
rownames(pamCIP)<-substr(rownames(pamCIP),1,6)
distance <- dist(pamCIP,method="binary")
clusters<- hclust( distance, method="complete")
# groups of clusters
hgroups(clusters$merge)



