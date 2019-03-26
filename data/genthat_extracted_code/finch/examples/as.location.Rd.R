library(finch)


### Name: as.location
### Title: Convert a path or URL to a location object
### Aliases: as.location as.location.character as.location.location
###   print.location

### ** Examples

# A zip file
file <- system.file("examples/0000154-150116162929234.zip",
  package = "finch")
as.location(file)

# A directory
dir <- system.file("examples/0000154-150116162929234",
  package = "finch")
as.location(dir)

# A URL
as.location("https://httpbin.org/get")



