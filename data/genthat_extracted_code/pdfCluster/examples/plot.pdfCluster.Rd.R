library(pdfCluster)


### Name: plot,pdfCluster-method
### Title: Plot objects of class pdfCluster
### Aliases: plot.pdfCluster plot,pdfCluster-method
###   plot,pdfCluster,missing-method
### Keywords: graphs hplot

### ** Examples

data(wine)
gr <- wine[,1]

# select a subset of variables
x <- wine[, c(2,5,8)]

#clustering
cl <- pdfCluster(x)
plot(cl, which=3, stage=2)

table(cl@clusters, gr)
#set "B" for Barolo, "G" for Grignolino, "A" for Barbera
plot(cl,  pch=c("B", "G", "A"), col=c(3,4,5))



