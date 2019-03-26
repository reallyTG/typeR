library(AmigaFFH)


### Name: getIFFChunk
### Title: Get a specific IFFChunk nested inside other IFFChunks
### Aliases: getIFFChunk getIFFChunk,IFFChunk,character,integer-method
###   getIFFChunk getIFFChunk,IFFChunk,character,missing-method
###   getIFFChunk<-
###   getIFFChunk<-,IFFChunk,character,missing,IFFChunk-method
###   getIFFChunk<-
###   getIFFChunk<-,IFFChunk,character,integer,IFFChunk-method

### ** Examples

## Not run: 
##D ## load an IFF file
##D example.iff <- read.iff(system.file("ilbm8lores.iff", package = "AmigaFFH"))
##D 
##D ## Get the BMHD (bitmap header) from the ILBM (interleaved bitmap) chunk:
##D bmhd <- getIFFChunk(example.iff, c("ILBM", "BMHD"))
##D 
##D ## This is essentially doing the same thing, but we now explicitly
##D ## tell the method to get the first element for each specified label:
##D bmhd <- getIFFChunk(example.iff, c("ILBM", "BMHD"), c(1L, 1L))
##D 
##D ## Let's modify the bitmap header and replace it in the parent IFF chunk.
##D bmhd.itpt <- interpretIFFChunk(bmhd)
##D 
##D ## Let's disable the masking, the bitmap will no longer be transparent:
##D bmhd.itpt$Masking <- "mskNone"
##D bmhd <- IFFChunk(bmhd.itpt)
##D 
##D ## Now replace the header from the original iff with the modified header:
##D getIFFChunk(example.iff, c("ILBM", "BMHD")) <- bmhd
## End(Not run)



