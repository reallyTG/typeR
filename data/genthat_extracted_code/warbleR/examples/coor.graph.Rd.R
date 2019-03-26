library(warbleR)


### Name: coor.graph
### Title: Coordinated singing graphs
### Aliases: coor.graph

### ** Examples

{

# First set temporary folder
# setwd(tempdir())

# load simulate singing events  (see data documentation)
data(sim.coor.sing)

# make coor.graphs in tiff format
coor.graph(X = sim.coor.sing, ovlp = TRUE, only.coor = FALSE, xl =2, res =80, 
it = "tiff", img = TRUE)


#' # make coor.graphs in graphic device format
cgs <- coor.graph(X = sim.coor.sing, ovlp = TRUE, only.coor = FALSE, img = FALSE)

cgs
}




