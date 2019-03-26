library(RSDA)


### Name: SODAS.to.RSDA
### Title: XML SODAS files to RSDA files.
### Aliases: SODAS.to.RSDA
### Keywords: Symbolic data table

### ** Examples

## Not run: 
##D # We can read the file directly from the SODAS XML file as follows:
##D # abalone<-SODAS.to.RSDA('C:/Program Files (x86)/DECISIA/SODAS version 2.0/bases/abalone.xml)
##D # We can save the file in CSV to RSDA format as follows:
##D # write.sym.table(sodas.ex1, file='abalone.csv', sep=';',dec='.', row.names=TRUE,
##D #               col.names=TRUE)
##D # We read the file from the CSV file,
##D # this is not necessary if the file is read directly from
##D # XML using SODAS.to.RSDA as in the first statement in this example.
##D data(abalone)
##D res<-sym.interval.pca(abalone,'centers')
##D sym.scatterplot(sym.var(res$Sym.Components,1),sym.var(res$Sym.Components,2),
##D                labels=TRUE,col='red',main='PCA Oils Data')
##D sym.scatterplot3d(sym.var(res$Sym.Components,1),sym.var(res$Sym.Components,2),
##D                  sym.var(res$Sym.Components,3),color='blue',main='PCA Oils Data')
##D sym.scatterplot.ggplot(sym.var(res$Sym.Components,1),sym.var(res$Sym.Components,2),
##D                       labels=TRUE)
##D sym.circle.plot(res$Sym.Prin.Correlations)
##D 
## End(Not run)



