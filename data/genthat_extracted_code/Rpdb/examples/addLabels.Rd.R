library(Rpdb)


### Name: addLabels
### Title: Add Labels to the 'rgl' Scene
### Aliases: addEleLab addEleLab.atoms addEleLab.pdb addLabels addResLab
###   addResLab.atoms addResLab.pdb info3d info3d.atoms info3d.pdb
### Keywords: dynamic

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
visualize(x, type = "l", mode = NULL)
addResLab(x)
x <- read.pdb(system.file("examples/Pentacene.pdb",package="Rpdb"))
visualize(x, type = "l", mode = NULL)
addEleLab(x)




