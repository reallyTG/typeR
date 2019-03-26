library(Rpdb)


### Name: visualize
### Title: Visualize a Molecular Structure
### Aliases: visualize visualize.atoms visualize.character visualize.coords
###   visualize.data.frame visualize.matrix visualize.pdb
### Keywords: dynamic

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
visualize(x, type = "l", mode = NULL)
visualize(x, type = "s", radii = "rcov", mode = NULL)
visualize(x, type = "s", radii = "rvdw", mode = NULL)
visualize(x, type = "p", mode = NULL)
visualize(subset(x, resid != 1), type = "l", mode = NULL)
visualize(subset(x, resid == 1), type = "s", add = TRUE, mode = NULL)




