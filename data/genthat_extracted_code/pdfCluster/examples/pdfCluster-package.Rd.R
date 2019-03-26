library(pdfCluster)


### Name: pdfCluster-package
### Title: The pdfCluster package: summary information
### Aliases: pdfCluster-package
### Keywords: package cluster multivariate nonparametric

### ** Examples

# load data
data(wine)
gr <- wine[, 1]

# select a subset of variables
x <- wine[, c(2, 5, 8)]

#density estimation
pdf <- kepdf(x)
summary(pdf)
plot(pdf)

#clustering
cl <- pdfCluster(x)
summary(cl)
plot(cl)

#comparison with original groups
table(groups(cl),gr)

#density based silhouette diagnostics
dsil <- dbs(cl)
plot(dsil)

##########
# higher dimensions

x <- wine[, -1]

#density estimation with adaptive bandwidth 
pdf <- kepdf(x, bwtype="adaptive")
summary(pdf)
#density plot is not much clear for high- dimensional data
#select a few variables
plot(pdf, indcol = c(1,4,7))

#clustering
#when dimension is >= 6, default method to find connected components is "pairs"
#density is better estimated by using an adaptive bandwidth
cl <- pdfCluster(x, bwtype="adaptive")
summary(cl)
plot(cl)

########
# this example shows how to set the arguments in function pdfCluster
# in order to obtain the same results as the ones of versions 0.1-x.
x <- wine[, c(2, 5, 8)]

# previous versions of the package 
# do not run
# old code: 
# cl <- pdfCluster(x)

# same result is obtained now obtained as follows:
cl <- pdfCluster(x, se=FALSE, hcores= TRUE, graphtype="delaunay", n.grid=50)



