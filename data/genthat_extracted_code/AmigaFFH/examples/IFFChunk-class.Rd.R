library(AmigaFFH)


### Name: IFFChunk-class
### Title: A class structure to represent IFF files
### Aliases: IFFChunk-class

### ** Examples

## Not run: 
##D ## load an IFF file
##D example.iff <- read.iff(system.file("ilbm8lores.iff", package = "AmigaFFH"))
##D 
##D ## 'example.iff' is of class IFFChunk:
##D class(example.iff)
##D 
##D ## let's plot it:
##D plot(example.iff)
##D 
##D ## The default constructor will create an empty FORM:
##D new("IFFChunk")
##D 
##D ## The constructor can also be used to create simple chunks:
##D new("IFFChunk",
##D     chunk.type = "TEXT",
##D     chunk.data = list(charToRaw("A simple chunk")))
## End(Not run)



