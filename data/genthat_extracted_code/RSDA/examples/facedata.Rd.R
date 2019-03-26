library(RSDA)


### Name: facedata
### Title: Face Data Example
### Aliases: facedata
### Keywords: datasets

### ** Examples

## Not run: 
##D data(facedata)
##D res.vertex.ps<-sym.interval.pc(facedata,'vertex',150,FALSE,FALSE,TRUE)
##D class(res.vertex.ps$sym.prin.curve) <- c('sym.data.table')
##D sym.scatterplot(res.vertex.ps$sym.prin.curve[,1], res.vertex.ps$sym.prin.curve[,2],
##D                 labels=TRUE,col='red',main='PSC Face Data')
##D                 
## End(Not run)



