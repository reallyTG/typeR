library(RSDA)


### Name: sym.histogram.pca
### Title: Histogram Principal Components Analysis
### Aliases: sym.histogram.pca
### Keywords: Histogram PCA

### ** Examples

data(example7)
res<-sym.histogram.pca(example7)
class(res) <- c('sym.data.table')
sym.scatterplot(res[,1],res[,2], labels=TRUE,col='red',main='Histogram PCA')
sym.scatterplot3d(res[,1],res[,2],res[,3],color='blue',
                  main='Histogram PCA')



