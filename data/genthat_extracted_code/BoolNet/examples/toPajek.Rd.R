library(BoolNet)


### Name: toPajek
### Title: Export a network to the Pajek file format
### Aliases: toPajek
### Keywords: Pajek Boolean network attractor cycle basin transition state
###   graph

### ** Examples

# load example data
data(cellcycle)

# get attractors
attractors <- getAttractors(cellcycle)

# export to Pajek
toPajek(attractors, file="pajek_export.net")



