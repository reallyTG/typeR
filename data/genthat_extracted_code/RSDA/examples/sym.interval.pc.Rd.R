library(RSDA)


### Name: sym.interval.pc
### Title: Compute a symbolic interval principal components curves
### Aliases: sym.interval.pc
### Keywords: Curve Principal

### ** Examples

## Not run: 
##D data(oils)
##D res.vertex.ps<-sym.interval.pc(oils,'vertex',150,FALSE,FALSE,TRUE)
##D class(res.vertex.ps$sym.prin.curve) <- c('sym.data.table')
##D sym.scatterplot(res.vertex.ps$sym.prin.curve[,1],res.vertex.ps$sym.prin.curve[,2],
##D                 labels=TRUE,col='red',main='PSC Oils Data')
##D 
##D data(facedata)
##D res.vertex.ps<-sym.interval.pc(facedata,'vertex',150,FALSE,FALSE,TRUE)
##D class(res.vertex.ps$sym.prin.curve) <- c('sym.data.table')
##D sym.scatterplot(res.vertex.ps$sym.prin.curve[,1],res.vertex.ps$sym.prin.curve[,2],
##D                 labels=TRUE,col='red',main='PSC Face Data')
## End(Not run)



