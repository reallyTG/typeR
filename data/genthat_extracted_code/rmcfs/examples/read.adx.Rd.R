library(rmcfs)


### Name: read.adx
### Title: Reads data from ADX
### Aliases: read.adx

### ** Examples

  ## Not run: 
##D ###dontrunbegin
##D 
##D   # create artificial data
##D   adata <- artificial.data(rnd_features = 1000)
##D   
##D   write.adx(adata, file = file.path(tempdir(), "adata.adx"), target = "class")
##D   adata <- read.adx(file = file.path(tempdir(), "adata.adx"))
##D   
##D   
## End(Not run)###dontrunend



