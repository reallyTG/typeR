library(pdfCluster)


### Name: dbs
### Title: Density-based silhouette information methods
### Aliases: dbs dbs-methods dbs,matrix,numeric-method
###   dbs,pdfCluster,missing-method dbs,matrix-method dbs,pdfCluster-method
### Keywords: cluster

### ** Examples

#example 1: no groups in data
#random generation of group labels
set.seed(54321)
x <- rnorm(50)
groups <- sample(1:2, 50, replace = TRUE)
groups
dsil <- dbs(x = as.matrix(x), clusters=groups)
dsil
summary(dsil)
plot(dsil, labels=TRUE, lwd=6)

#example 2: wines data
# load data
data(wine)

# select a subset of variables
x <- wine[, c(2,5,8)]

#clustering
cl <- pdfCluster(x)
 
dsil <- dbs(cl)
plot(dsil)




