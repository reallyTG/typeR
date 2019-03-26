library(Rpdb)


### Name: viewAxis
### Title: Set the View of the 'rgl' Scene
### Aliases: viewAB viewAxis viewBC viewCA viewInertia viewXY viewYZ viewZX
### Keywords: dynamic

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
visualize(x, mode = NULL)
viewAB(x$cryst1)

C70 <- read.pdb(system.file("examples/C70.pdb",package="Rpdb"))
visualize(C70, mode = NULL)
viewXY()
viewInertia(C70)




