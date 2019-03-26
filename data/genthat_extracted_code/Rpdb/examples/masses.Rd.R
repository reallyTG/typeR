library(Rpdb)


### Name: masses
### Title: Mass of Chemical Elements
### Aliases: masses masses.default masses.pdb
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
masses(x)

masses(c("C","Cl",NA,"AA","N"))




