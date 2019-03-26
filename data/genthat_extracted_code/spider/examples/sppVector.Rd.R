library(spider)


### Name: sppVector
### Title: Species Vectors
### Aliases: sppVector
### Keywords: Utilities

### ** Examples

data(dolomedes)
#Dolomedes species vector
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

data(anoteropsis)
#Anoteropsis species vector
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
    function(x) paste(x[1], x[2], sep="_"))





