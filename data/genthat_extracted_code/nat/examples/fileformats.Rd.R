library(nat)


### Name: fileformats
### Title: Set or return list of registered file formats that we can read
### Aliases: fileformats registerformat getformatreader getformatwriter

### ** Examples

# information about the currently registered file formats
fileformats(rval='info')
## Not run: 
##D registerformat("swc",read=read.swc,write=read.swc,magic=is.swc,magiclen=10,
##D   class='neuron')
## End(Not run)
swc=tempfile(fileext = '.swc')
write.neuron(Cell07PNs[[1]], swc)
stopifnot(isTRUE(getformatreader(swc)$format=='swc'))
unlink(swc)



