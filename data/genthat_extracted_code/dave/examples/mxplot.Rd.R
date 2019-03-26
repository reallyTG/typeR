library(dave)


### Name: mxplot
### Title: Matrixplot of groups similarities
### Aliases: mxplot mxplot.default plot.mxplot matrixplot
### Keywords: multivariate hplot

### ** Examples

# Starts with classifying releves by cluster analysis
dd<- vegdist(sveg^0.5,method="euclid")         # dd is distance matrix
o.clust<- hclust(dd,method="ward")             # clustering
groups<- as.factor(cutree(o.clust,k=6))        # forming 6 groups

o.mxpl<- mxplot(sveg,groups,use="rows",y=0.5)
plot(o.mxpl,capacity=30)



