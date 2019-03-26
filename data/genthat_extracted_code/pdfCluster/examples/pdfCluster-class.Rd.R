library(pdfCluster)


### Name: pdfCluster-class
### Title: Class "pdfCluster"
### Aliases: pdfCluster-class show,pdfCluster-method summary.pdfCluster
### Keywords: classes cluster multivariate

### ** Examples

showClass("pdfCluster")

data(wine)
x <-wine[ ,-1]
gr <- wine[ ,1]

# clustering
cl <- pdfCluster(x, graphtype="pairs", bwtype="adaptive")
summary(cl)
cl
plot(cl)



