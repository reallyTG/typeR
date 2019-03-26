library(pdfCluster)


### Name: plot,dbs-method
### Title: Plot objects of class dbs
### Aliases: plot,dbs-method plot.dbs plot,dbs,missing-method
### Keywords: hplot

### ** Examples

#example 1: no groups in data
#random generation of group labels
set.seed(54321)
x <- rnorm(50)
groups <- sample(1:2, 50, replace=TRUE)
groups
dsil <- dbs(x=as.matrix(x), clusters=groups)
dsil
summary(dsil)
plot(dsil, labels=TRUE, lwd=6)

#example 2: wines data
# load data
data(wine)

gr <- wine[,1]

# select a subset of variables
x <- wine[, c(2,5,8)]

#clustering
cl <- pdfCluster(x)
 
dsil <- dbs(cl)
plot(dsil)



