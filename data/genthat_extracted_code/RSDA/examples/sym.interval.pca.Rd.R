library(RSDA)


### Name: sym.interval.pca
### Title: Interval Principal Components Analysis.
### Aliases: sym.interval.pca
### Keywords: Intervals PCA

### ** Examples

## Not run: 
##D data(oils)
##D res<-sym.interval.pca(oils,'centers')
##D class(res) <- c('sym.data.table')
##D sym.scatterplot(res$Sym.Components[,1],res$Sym.Components[,1],
##D                 labels=TRUE,col='red',main='PCA Oils Data')
##D sym.scatterplot3d(res$Sym.Components[,1],res$Sym.Components[,2],
##D                   res$Sym.Components[,3],color='blue',main='PCA Oils Data')
##D sym.scatterplot.ggplot(res$Sym.Components[,1],res$Sym.Components[,2],
##D                        labels=TRUE)
##D sym.circle.plot(res$Sym.Prin.Correlations)
##D 
##D res<-sym.interval.pca(oils,'classic')
##D plot(res,choix='ind')
##D plot(res,choix='var')
##D 
##D data(lynne2)
##D res<-sym.interval.pca(lynne2,'centers')
##D class(res$Sym.Components) <- c('sym.data.table')
##D sym.scatterplot(res$Sym.Components[,1],res$Sym.Components[,2],
##D                 labels=TRUE,col='red',main='PCA Lynne Data')
##D sym.scatterplot3d(res$Sym.Components[,1],res$Sym.Components[,2],
##D                   res$Sym.Components[,3],color='blue', main='PCA Lynne Data')
##D sym.scatterplot.ggplot(res$Sym.Components[,1],res$Sym.Components[,2],
##D                        labels=TRUE)
##D sym.circle.plot(res$Sym.Prin.Correlations)
##D 
##D data(StudentsGrades)
##D st<-StudentsGrades
##D s.pca<-sym.interval.pca(st)
##D plot(s.pca,choix='ind')
##D plot(s.pca,choix='var')
## End(Not run)



