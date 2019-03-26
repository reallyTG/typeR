library(RSDA)


### Name: interscal
### Title: Interscal Method
### Aliases: interscal
### Keywords: Interscal

### ** Examples

## Not run: 
##D data(oils)
##D res<-interscal(oils)
##D class(res$Sym.Components) <- c('sym.data.table')
##D sym.scatterplot(res$Sym.Components[,1], res$Sym.Components[,2],
##D                 labels=TRUE,col='red',main='Interscal CFA Data')
##D sym.scatterplot3d(res$Sym.Components[,1], res$Sym.Components[,2],
##D                   res$Sym.Components[,3],color='blue',
##D                   labels=TRUE,main='Interscal CFA Data')
##D sym.scatterplot.ggplot(res$Sym.Components[,1],res$Sym.Components[,2],
##D                        labels=TRUE)
## End(Not run)



