library(osmar)


### Name: as_osmar
### Title: Convert OSM-XML to an osmar object
### Aliases: as_osmar osmar

### ** Examples

file <- system.file("extdata", "kaufstr.xml", package = "osmar")
  raw <- readLines(file)
  kaufstr <- as_osmar(xmlParse(raw))



