library(Rpdb)


### Name: translation
### Title: Translation of Atomic Coordinates
### Aliases: Tabc Tabc.coords Tabc.pdb Txyz Txyz.coords Txyz.pdb
###   translation
### Keywords: manip

### ** Examples

# First lets read a pdb file
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
visualize(x, mode = NULL)
visualize(Txyz(x, y=10), mode = NULL)
visualize(Txyz(x, y=10, mask=x$atoms$resid==1), mode = NULL)
visualize(Tabc(x, b=1 ), mode = NULL)
visualize(Tabc(x, b=1 , mask=x$atoms$resid==1), mode = NULL)

# Lets build a C70/Pentacene dimer with an inter-molecular distance equal to 3.5
C70 <- read.pdb(system.file("examples/C70.pdb",package="Rpdb"))
Pen <- read.pdb(system.file("examples/Pentacene.pdb",package="Rpdb"))
x <- merge(C70,Pen)
visualize(x, mode = NULL)
viewXY()
visualize(Txyz(x, x=0, y=0, z=3.5, mask=x$atoms$resname=="C70", thickness=0.5), mode = NULL)
viewXY()




