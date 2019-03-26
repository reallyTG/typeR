library(rmcfs)


### Name: write.adx
### Title: Writes data to ADX
### Aliases: write.adx

### ** Examples

  ## Not run: 
##D ###dontrunbegin
##D 
##D   # create artificial data
##D   adata <- artificial.data(rnd_features = 1000)
##D   
##D   #Fix input data to be consistent with ARFF and ADX formats. 
##D   #It is not necessary but for some data can help to export in proper format.
##D   adata <- fix.data(adata)
##D   write.adx(adata, file = file.path(tempdir(), "adata.adx"), target = "class")
##D   
##D   
## End(Not run)###dontrunend



