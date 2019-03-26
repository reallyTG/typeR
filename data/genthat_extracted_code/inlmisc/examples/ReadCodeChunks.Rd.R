library(inlmisc)


### Name: ReadCodeChunks
### Title: Read Knitr Code Chunks
### Aliases: ReadCodeChunks
### Keywords: utilities

### ** Examples

## Not run: 
##D file <- system.file("misc", "knitr-markdown.Rmd", package = "inlmisc")
##D chunks <- ReadCodeChunks(file)
##D 
##D attr(chunks, "path")
##D names(chunks)
##D chunks[["named-chunk-2"]]
##D 
##D eval(parse(text = unlist(chunks[c("unnamed-chunk-3", "named-chunk-4")])))
## End(Not run)




