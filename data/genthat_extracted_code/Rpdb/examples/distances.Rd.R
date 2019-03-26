library(Rpdb)


### Name: distances
### Title: Inter-Atomic Distances
### Aliases: distances distances.atoms distances.coords distances.default
###   distances.pdb is.distances norm norm.distances
### Keywords: classes manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
is.DCB7 <- x$atoms$resname == "DCB" & x$atoms$resid == 7
is.DCB8 <- x$atoms$resname == "DCB" & x$atoms$resid == 8
d <- distances(x, is.DCB7, is.DCB8)
norm(d, type = "xyz")
norm(d, type = "xy")
norm(d, type = "x")




