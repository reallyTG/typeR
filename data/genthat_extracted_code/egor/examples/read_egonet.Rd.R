library(egor)


### Name: read_egonet
### Title: Read ego-centered network data exported with EgoNet software as
###   an 'egor' object
### Aliases: read_egonet
### Keywords: ego-centered import

### ** Examples

egos.file <-  system.file("extdata", "egos_32.csv", package = "egor")
alters.folder <- system.file("extdata", "alters_32", package = "egor")
edge.folder <-  system.file("extdata", "edges_32", package = "egor")

ef <- read_egonet(egos.file = egos.file, 
                          alter.folder = alters.folder, 
                          edge.folder = edge.folder, 
                          csv.sep = ";")



