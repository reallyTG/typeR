library(dendsort)


### Name: cal_length
### Title: Recursive function to calculate the length of branches
### Aliases: cal_length
### Keywords: internal

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

total_length <- cal_total_length(as.dendrogram(hc))




