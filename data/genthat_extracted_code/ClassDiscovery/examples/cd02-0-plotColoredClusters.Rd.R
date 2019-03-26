library(ClassDiscovery)


### Name: plotColoredClusters
### Title: Plot Dendrograms with Color-Coded Labels
### Aliases: plotColoredClusters pcc
### Keywords: hplot cluster

### ** Examples

# simulate data from three different groups
d1 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d2 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d3 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
dd <- cbind(d1, d2, d3)

# perform hierarchical clustering using correlation
hc <- hclust(distanceMatrix(dd, 'pearson'), method='average')
cols <- rep(c('red', 'green', 'blue'), each=10)
labs <- paste('X', 1:30, sep='')

# plot the dendrogram with color-coded groups
plotColoredClusters(hc, labs=labs, cols=cols)

# simulate another dataset
fakedata <- matrix(rnorm(200*30), ncol=30)
colnames(fakedata) <- paste("P", 1:30, sep='')
# define two basic factors, with colors
faccol <- list(fac=factor(rep(c("A", "B"), each=15)),
               col=c(A='red', B='green'))
fac2col <- list(fac=factor(rep(c("X", "Y", "Z"), times=10)),
               col=c(X='cyan', Y='orange', Z='purple'))
# add another factor that reverses the colors
BA <- faccol
BA$col <- c(A='blue', B='yellow')
# assemble the list of factors
colors <- list(AB=faccol, XYZ=fac2col, "tricky long name"=fac2col,
               another=BA)
# cluster the samples
hc <- hclust(distanceMatrix(fakedata, "pearson"), "ward")
# plot the results
pcc(hc, colors)


#cleanup
rm(d1, d2, d3, dd, hc, cols, labs)
rm(fakedata, faccol, fac2col, BA, colors)



