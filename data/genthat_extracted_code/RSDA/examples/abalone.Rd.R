library(RSDA)


### Name: abalone
### Title: SODAS XML data file.
### Aliases: abalone
### Keywords: datasets

### ** Examples

data(abalone)
res<-sym.interval.pca(abalone,'centers')
class(res$Sym.Components) <- c('sym.data.table')
sym.scatterplot(res$Sym.Components[,1],res$Sym.Components[,2],
labels=TRUE,col='red',main='PCA Oils Data')
sym.scatterplot3d(res$Sym.Components[,1],res$Sym.Components[,2],
res$Sym.Components[,3],color='blue',main='PCA Oils Data')
sym.scatterplot.ggplot(res$Sym.Components[,1],
res$Sym.Components[,2],labels=TRUE)
sym.circle.plot(res$Sym.Prin.Correlations)



