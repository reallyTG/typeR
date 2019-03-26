library(dendsort)


### Name: dendsort
### Title: Sorting and reordering dendrogram nodes
### Aliases: dendsort
### Keywords: dendrogram

### ** Examples

#generate sample data
set.seed(1234); par(mar=c(0,0,0,0))
x <- rnorm(10, mean=rep(1:5, each=2), sd=0.4)
y <- rnorm(10, mean=rep(c(1,2), each=5), sd=0.4)
dataFrame <- data.frame(x=x, y=y, row.names=c(1:10))
#calculate Euclidian distance
distxy <- dist(dataFrame)
#hierachical clustering "complete" linkage by default
hc <- hclust(distxy)

#sort dendrogram
dd <- dendsort(as.dendrogram(hc))
hc_sorted  <- as.hclust(dd)

#sort in reverse, you can also pass hclust object
plot(dendsort(hc, isReverse=TRUE))

#sort by average distance
plot(dendsort(hc, type="average"))

#plot the result
par(mfrow = c(1, 3), mai=c(0.8,0.8,2,0.8))
plot(x, y, col="gray", pch=19, cex=2)
text(x, y, labels=as.character(1:10), cex=0.9)
plot(hc,main="before sorting", xlab="", sub="")
plot(hc_sorted, main="after sorting", xlab="", sub="")




