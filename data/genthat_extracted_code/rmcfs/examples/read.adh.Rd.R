library(rmcfs)


### Name: read.adh
### Title: Reads data from ADH
### Aliases: read.adh

### ** Examples

  ## Not run: 
##D ###dontrunbegin
##D 
##D   # create artificial data
##D   adata <- artificial.data(rnd_features = 1000)
##D 
##D   write.adh(adata, file = file.path(tempdir(), "adata.adh"), target = "class")
##D   adata <- read.adh(file = file.path(tempdir(), "adata.adh"))
##D   
##D   
## End(Not run)###dontrunend



