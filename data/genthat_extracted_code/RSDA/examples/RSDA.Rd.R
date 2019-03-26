library(RSDA)


### Name: RSDA
### Title: R to Symbolic Data Analysis
### Aliases: RSDA RSDA-package
### Keywords: package

### ** Examples

data(example3)
sym.data<-example3
class(sym.data) <- c('sym.data.table')
display.sym.table(sym.data)
sym.scatterplot(sym.data[,1], sym.data[,4], col='blue',main='Main Title')

data(oils)
class(oils) <- c('sym.data.table')
res<-sym.interval.pca(oils,'centers')
sym.scatterplot(res$Sym.Components[,1],res$Sym.Components[,2],
                labels=TRUE,col='red',main='PCA Oils Data')
sym.scatterplot3d(res$Sym.Components[,1], res$Sym.Components[,2],
                  res$Sym.Components[,3],color='blue',main='PCA Oils Data')
sym.scatterplot.ggplot(res$Sym.Components[,1],
                       res$Sym.Components[,2], labels=TRUE)
sym.circle.plot(res$Sym.Prin.Correlations)

res<-sym.interval.pca(oils,'classic')
plot(res,choix='ind')
plot(res,choix='var')

data(lynne2)
res<-sym.interval.pca(lynne2,'centers')
class(res$Sym.Components) <- c('sym.data.table')
sym.scatterplot(res$Sym.Components[,1], res$Sym.Components[,2],
                labels=TRUE, col='red',main='PCA Lynne Data')
sym.scatterplot3d(res$Sym.Components[,1],res$Sym.Components[,2],
                  res$Sym.Components[,3],color='blue', main='PCA Lynne Data')
sym.scatterplot.ggplot(res$Sym.Components[,1],res$Sym.Components[,2],
                       labels=TRUE)
sym.circle.plot(res$Sym.Prin.Correlations)



