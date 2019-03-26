library(Rpdb)


### Name: translationHelpers
### Title: Helper Functions for Translation of Atomic Coordinates
### Aliases: Ta Ta.coords Ta.pdb Tb Tb.coords Tb.pdb Tc Tc.coords Tc.pdb Tx
###   Tx.coords Tx.pdb Ty Ty.coords Ty.pdb Tz Tz.coords Tz.pdb
###   translationHelpers
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
visualize(x, mode = NULL)
visualize(Ty(x, 10), mode = NULL)
visualize(Ty(x, 10, mask=x$atoms$resid==1), mode = NULL)
visualize(Tb(x, 1 ), mode = NULL)
visualize(Tb(x, 1 , mask=x$atoms$resid==1), mode = NULL)

# Lets build a C70/Pentacene dimer with an inter-molecular distance equal to 3.5
C70 <- read.pdb(system.file("examples/C70.pdb",package="Rpdb"))
Pen <- read.pdb(system.file("examples/Pentacene.pdb",package="Rpdb"))
x <- merge(C70,Pen)
visualize(x, mode = NULL)
viewXY()
visualize(Tz(x, z=3.5, mask=x$atoms$resname=="C70", thickness=0.5), mode = NULL)
viewXY()




