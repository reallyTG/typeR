library(Rpdb)


### Name: basis
### Title: The Basis of an Object
### Aliases: basis basis.default basis.pdb basis<- basis<-.default
###   basis<-.pdb
### Keywords: attribute

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
basis(x)
x <- xyz2abc(x)
basis(x)




