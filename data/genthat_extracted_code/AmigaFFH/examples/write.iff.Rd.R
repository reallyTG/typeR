library(AmigaFFH)


### Name: write.iff
### Title: Write Interchange File Format (IFF)
### Aliases: write.iff

### ** Examples

## Not run: 
##D ## read an IFF file as an IFFChunk object:
##D example.iff <- read.iff(system.file("ilbm8lores.iff", package = "AmigaFFH"))
##D 
##D ## This will write the IFF file (in this case a bitmap image)
##D ## to the temp directory:
##D write.iff(example.iff, file.path(tempdir(), "image.iff"))
##D 
## End(Not run)



