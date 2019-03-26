library(Rpdb)


### Name: inertia
### Title: Moment of Inertia of a Molecular System
### Aliases: inertia inertia.atoms inertia.coords inertia.pdb
### Keywords: manip

### ** Examples

C70 <- read.pdb(system.file("examples/C70.pdb",package="Rpdb"))
inertia(C70)
visualize(C70, mode = NULL)
viewXY()
viewInertia(C70)




