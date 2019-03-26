library(gclus)


### Name: reorder.hclust
### Title: Reorders object order of hclust, keeping objects within a
###   cluster contiguous to each other.
### Aliases: reorder.hclust
### Keywords: multivariate cluster

### ** Examples


data(eurodist)
dis <- as.dist(eurodist)
hc <- hclust(dis, "ave")


layout(matrix(1:2,nrow=2,ncol=1))
op <- par(mar=c(1,1,1,1))
plot(hc)
hc1 <- reorder.hclust(hc, dis)
plot(hc1)
par(op)
layout(matrix(1,1))

# Both dedrograms correspond to the same tree structure,
# but the second one shows that
# Paris is closer to Cherbourg than Munich, and
# Rome is closer to Gibralter than to Barcelona.


# We can also compare both orderings with an
# image plot of the colors.
# The second ordering seems to place nearby cities
# closer to each other.


layout(matrix(1:2,nrow=2,ncol=1))
op <- par(mar=c(1,6,1,1))
cmat <- dmat.color(eurodist, rev(cm.colors(5)))
plotcolors(cmat[hc$order,hc$order], rlabels=labels(eurodist)[hc$order])

plotcolors(cmat[hc1$order,hc1$order], rlabels=labels(eurodist)[hc1$order])

layout(matrix(1,1))
par(op)




