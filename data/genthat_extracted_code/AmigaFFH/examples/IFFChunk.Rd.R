library(AmigaFFH)


### Name: IFFChunk-method
### Title: Coerce to and create IFFChunk objects
### Aliases: IFFChunk-method IFFChunk IFFChunk.character IFFChunk.IFF.FORM
###   IFFChunk.IFF.BODY IFFChunk.IFF.ANNO IFFChunk.IFF.AUTH
###   IFFChunk.IFF.CHRS IFFChunk.IFF.NAME IFFChunk.IFF.TEXT
###   IFFChunk.IFF.copyright IFFChunk.IFF.CHAN IFFChunk.IFF.VHDR
###   IFFChunk.IFF.8SVX IFFChunk.IFF.ILBM IFFChunk.IFF.CMAP
###   IFFChunk.IFF.BMHD IFFChunk.IFF.CAMG IFFChunk.IFF.CRNG
###   IFFChunk.IFF.ANIM IFFChunk.IFF.ANHD IFFChunk.IFF.DLTA
###   IFFChunk.IFF.DPAN

### ** Examples

## Not run: 
##D ## load an IFF file
##D example.iff <- read.iff(system.file("ilbm8lores.iff", package = "AmigaFFH"))
##D 
##D ## interpret the IFF file (in some cases information
##D ## will get lost in this step):
##D example.itpt <- interpretIFFChunk(example.iff)
##D 
##D ## now coerce back to a formal IFFChunk class object.
##D ## Only information in the interpreted object is used
##D ## The coerced object may therefore depart from the
##D ## original read from the file.
##D example.coerce <- IFFChunk(example.itpt)
##D 
##D ## and indeed the objects are not identical, as shown below.
##D ## In this case the difference is not disastrous, the order
##D ## of the colours in the palette have shifted. But be careful
##D ## with switching between formal IFFChunk objects and
##D ## interpreted IFF.ANY objects.
##D identical(example.iff, example.coerce)
##D 
##D ## It is also possible to create simple IFFChunk objects
##D ## by providing the desired chunk type identifier as a
##D ## character string.
##D 
##D ## This creates a basic bitmap header:
##D bmhd <- IFFChunk("BMHD")
##D 
##D ## This creates a basic colour palette:
##D cmap <- IFFChunk("CMAP")
## End(Not run)



