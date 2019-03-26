library(osmar)


### Name: as_igraph
### Title: Convert osmar object to igraph
### Aliases: as_igraph

### ** Examples

file <- system.file("extdata", "kaufstr.xml", package = "osmar")
raw <- readLines(file)
kaufstr <- as_osmar(xmlParse(raw))
kaufstrGraph <- as_igraph(kaufstr)



