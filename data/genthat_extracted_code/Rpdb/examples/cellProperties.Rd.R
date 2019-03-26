library(Rpdb)


### Name: cellProperties
### Title: Properties of a Unit Cell
### Aliases: cell.coords cell.coords.cryst1 cell.coords.default
###   cell.coords.pdb cell.density cell.density.default cell.density.pdb
###   cell.volume cell.volume.cryst1 cell.volume.pdb cellProperties
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
cell.volume(x)
cell.density(x)
cell.coords(x)




