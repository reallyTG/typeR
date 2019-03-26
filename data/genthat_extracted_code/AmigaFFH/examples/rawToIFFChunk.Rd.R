library(AmigaFFH)


### Name: rawToIFFChunk
### Title: Coerce raw data to an IFFChunk class object
### Aliases: rawToIFFChunk rawToIFFChunk,raw-method

### ** Examples

## Not run: 
##D ## Get an IFFChunk object:
##D example.iff <- read.iff(system.file("ilbm8lores.iff", package = "AmigaFFH"))
##D 
##D ## Coerce it to raw data:
##D example.raw <- as.raw(example.iff)
##D 
##D ## Coerce raw data to IFF chunk:
##D example.iff.new <- rawToIFFChunk(example.raw)
##D 
##D ## These conversions were non-destructive:
##D identical(example.iff, example.iff.new)
## End(Not run)



