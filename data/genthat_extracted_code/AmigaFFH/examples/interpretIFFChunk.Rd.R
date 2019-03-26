library(AmigaFFH)


### Name: interpretIFFChunk
### Title: Interpret an IFFChunk object
### Aliases: interpretIFFChunk interpretIFFChunk,IFFChunk-method

### ** Examples

## Not run: 
##D ## load an IFF file
##D example.iff <- read.iff(system.file("ilbm8lores.iff", package = "AmigaFFH"))
##D 
##D ## in this case, the file is a FORM container with a bitmap image, and a
##D ## list with a raster object is returned when interpreted:
##D example.itpt <- interpretIFFChunk(example.iff)
##D class(example.itpt)
##D typeof(example.itpt)
##D class(example.itpt[[1]])
##D 
##D ## Let's extraxt the bitmap header from the main chunk:
##D bmhd <- getIFFChunk(example.iff, c("ILBM", "BMHD"))
##D 
##D ## When interpreted, a named list is returned with (meta-)information
##D ## on the bitmap image:
##D bmhd.itpt <- interpretIFFChunk(bmhd)
##D class(bmhd.itpt)
##D typeof(bmhd.itpt)
##D print(bmhd.itpt)
## End(Not run)



